addpath(genpath('~\buzcode-master'))
addpath(genpath('~\CellExplorer-main'))

%% 1. INITIAL SETUP AND DATA CONCATENATION

% Set the basepath to the current working directory and check for xml file
basepath = pwd;
cd(basepath)

% Extract the basename from the basepath (e.g., 'animalID_date_time')
basename = bz_BasenameFromBasepath(basepath);

% Load or create the session information structure (.sessionInfo.mat)
% The GUI allows you to define key parameters like sampling rate, channel groups, and region mapping.
session = sessionTemplate(basepath,'showGUI',false);
% Manual save if GUI isn't used to save
save(fullfile(basepath, [basename '.session.mat']), 'session');

% Concatenate all raw .dat files in the basepath into a single file.
% This is necessary if your recording system saves data in multiple segments.
% deleteoriginaldatsbool = 0; and sortFiles = 1;
bz_ConcatenateDats(basepath, 0, 1);

%% 2. LFP GENERATION

% Generate a .lfp file (downsampled version of the .dat)
% This file is used for fast LFP analysis and sleep scoring.
bz_LFPfromDat(basepath);

%% 3. DIGITAL CHANNELS AND MANIPULATION DEFINITION

% Process the digital input file (e.g., _digitalin.dat) to find ON and OFF samples
[digital_on,digital_off] = Process_IntanDigitalChannels('digitalin.dat');
save('digitalchannels.mat','digital_on','digital_off');

% --- USER CUSTOMIZATION REQUIRED ---
% Select and combine the digital channels that correspond to your specific stimulus/manipulation.
% Replace X, Y, Z with the indices of the digital channels that mark the stimulus onset.
digiOn = []; digiOff = [];
digiOn = sort([digital_on{1,X};digital_on{1,Y};digital_on{1,Z}]); 
digiOff = sort([digital_off{1,X};digital_off{1,Y};digital_off{1,Z}]);
digiAll = sort([digiOn;digiOff]);

% Define number of trials and events per trial (must match your stimulus protocol)
events_per_trial = 6; % Adjust this value based on your protocol
trials = floor(length(digiOn)/events_per_trial);

% Populate the stimulation structure
stimulation = [];
stimulation.startSample = reshape(digiOn(1:trials*events_per_trial),events_per_trial,[]); 

% Convert samples to time (seconds)
% NOTE: Replace '2e4' with the actual sampling rate (session.extracellular.sr)
sampling_rate = 20000; % <--- UPDATE THIS VALUE
stimulation.startTime = stimulation.startSample/sampling_rate; 
stimulation.endSample = reshape(digiOff(1:trials*events_per_trial),events_per_trial,[]);
stimulation.endTime = stimulation.endSample/sampling_rate;

% Define the YOURmanipulation structure (for general Buzcode compatibility)
YOURmanipulation = [];
YOURmanipulation.On = stimulation.startSample; 
YOURmanipulation.Off = stimulation.endSample;
YOURmanipulation.timestamps = reshape(stimulation.startTime,[],1);
YOURmanipulation.timestamps(1:numel(stimulation.startTime),2) = reshape(stimulation.endTime,[],1);

% Define the stimulus parameters for analysis
% --- USER CUSTOMIZATION REQUIRED ---
YOURmanipulation.amplitude = [500 -500 1000 -1000 1500 -1500]; % Example amplitudes (in your desired units)

% Calculate center time and duration
YOURmanipulation.center = YOURmanipulation.timestamps(:,1) + (YOURmanipulation.timestamps(:,2) - YOURmanipulation.timestamps(:,1))/2;
YOURmanipulation.duration = YOURmanipulation.timestamps(:,2) - YOURmanipulation.timestamps(:,1);

% Save the generated manipulation files
save([basepath filesep basename '.YOURmanipulation.manipulation.mat'],'YOURmanipulation');
save([basepath filesep basename '.stimulation.mat'],'stimulation');

%% 4. ARTIFACT REMOVAL

% 1. Define artifact boundaries for interpolation
% The following logic defines a 1.5ms window around the ON and OFF times of each pulse.
% Review the artifact shape in Neuroscope and adjust the offsets (e.g., -0.001 and +0.0015) accordingly.
artefact = [];

% Start time of artifact windows (two windows per pulse: one near ON, one near OFF)
artefact(1:2:2*size(YOURmanipulation.timestamps,1),1) = YOURmanipulation.timestamps(:,1) - 0.001; % Start near pulse ON
artefact(2:2:2*size(YOURmanipulation.timestamps,1),1) = YOURmanipulation.timestamps(:,2) - 0.001; % Start near pulse OFF

% End time of artifact windows (1.5ms duration)
artefact(:,2) = artefact(:,1) + 0.0015;

% 2. Linearly interpolate over the defined artifact periods in the raw .dat file
% This requires the custom function 'RemoveArtefact_dat' (provided below)
RemoveArtefact_dat([basepath filesep basename '.dat'],artefact); 

% 3. Remove broader noise (e.g., muscle/movement artifacts)
% This step calculates the median across all channels at each time point and subtracts it,
% improving the signal-to-noise ratio for spike sorting.
channels = unique(cell2mat(session.extracellular.spikeGroups.channels));
removeNoiseFromDat(basepath,'method','substractMedian','ch', channels);

%% 5. SLEEP SCORING

% Load or edit the sessionInfo file. Ensure bad channels are correctly marked.
sessionInfo = bz_getSessionInfo(basepath,'editGUI',true); 

% Run the automated sleep scoring algorithm on the LFP file
SleepScoreMaster(basepath);

% Manually review and correct the automated scoring using the StateEditor
TheStateEditor
