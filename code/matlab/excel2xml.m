function channelGroups = excel2xml(excelFile, varargin)
% excel2xml - Generate synchronized XML configuration from Excel channel map
%
% This version ensures anatomicalDescription and spikeDetection groups 
% are perfectly aligned and formatted to match Workshop_test_data.xml.

% Default settings
genXML_path = pwd;

p = inputParser;
addRequired(p, 'excelFile', @(x) ischar(x) || isstring(x));
addParameter(p, 'basepath', pwd, @isfolder);
addParameter(p, 'samplingRate', 20000, @isnumeric);
addParameter(p, 'xmlFile', '', @(x) ischar(x) || isstring(x)); 
addParameter(p, 'genXML_path', genXML_path, @(x) ischar(x) || isstring(x));
addParameter(p, 'refChan', [], @isnumeric);
addParameter(p, 'addSyncChannel', false, @islogical);
addParameter(p, 'syncChannel', 384, @isnumeric);

parse(p, excelFile, varargin{:});
excelFile = char(p.Results.excelFile);
basepath = p.Results.basepath;
samplingRate = p.Results.samplingRate;
xmlFile = char(p.Results.xmlFile);
genXML_path = char(p.Results.genXML_path);
refChan = p.Results.refChan;
addSyncChannel = p.Results.addSyncChannel;
syncChannel = p.Results.syncChannel;

%% 1. Read Excel file (Sheet 2)
fprintf('Reading Excel file: %s\n', excelFile);
T = readtable(excelFile, 'Sheet', 2, 'ReadVariableNames', false);
A = table2array(T);
A = A'; % Each row is now a group

channelGroups = {};
for r = 1:size(A, 1)
    row = A(r, :);
    row = row(~isnan(row)); % Remove NaN values
    if ~isempty(row)
        channelGroups{end+1} = row;
    end
end

if addSyncChannel
    channelGroups{end+1} = syncChannel;
end

% Calculate total unique channels for nChannels tag
allChannels = [channelGroups{:}];
nChannels = length(unique(allChannels));

%% 2. Load Template
if isempty(xmlFile)
    xmlFile = fullfile(genXML_path, 'generic_XML.xml'); 
end
if ~exist(xmlFile, 'file')
    error('Template XML not found at %s', xmlFile);
end
xmlText = fileread(xmlFile);

%% 3. Build Synchronized Sections
% Initialize strings with required parent tags
anaStr = sprintf(' <anatomicalDescription>\n  <channelGroups>\n');
spkStr = sprintf(' <spikeDetection>\n  <channelGroups>\n');

for g = 1:numel(channelGroups)
    thisGroup = channelGroups{g};
    
    % Build Anatomical Group
    anaStr = [anaStr, sprintf('   <group>\n')];
    for ch = 1:numel(thisGroup)
        anaStr = [anaStr, sprintf('    <channel skip="0">%d</channel>\n', thisGroup(ch))];
    end
    anaStr = [anaStr, sprintf('   </group>\n')];
    
    % Build Spike Group (Synchronized with same channels)
    spkStr = [spkStr, sprintf('   <group>\n    <channels>\n')];
    for ch = 1:numel(thisGroup)
        % Only add if it's not the reference channel
        if isempty(refChan) || thisGroup(ch) ~= refChan
            spkStr = [spkStr, sprintf('     <channel>%d</channel>\n', thisGroup(ch))];
        end
    end
    spkStr = [spkStr, sprintf('    </channels>\n   </group>\n')];
end

anaStr = [anaStr, sprintf('  </channelGroups>\n </anatomicalDescription>')];
spkStr = [spkStr, sprintf('  </channelGroups>\n </spikeDetection>')];

%% 4. Apply Replacements
% Replace Sections
xmlText = regexprep(xmlText, '(?s)<anatomicalDescription>.*?</anatomicalDescription>', anaStr, 'once');
xmlText = regexprep(xmlText, '(?s)<spikeDetection>.*?</spikeDetection>', spkStr, 'once');

% Update Metadata
xmlText = regexprep(xmlText, '<samplingRate>\d+</samplingRate>', sprintf('<samplingRate>%d</samplingRate>', samplingRate));
xmlText = regexprep(xmlText, '<nChannels>\d+</nChannels>', sprintf('<nChannels>%d</nChannels>', nChannels));

% Ensure Creator matches Workshop style if needed
xmlText = regexprep(xmlText, 'creator="[^"]*"', 'creator="ndManager-"', 'once');

%% 5. Save Output
[~, basename] = fileparts(basepath);
if isempty(basename), basename = 'session'; end
outputName = fullfile(basepath, [basename '.xml']);

fid = fopen(outputName, 'w');
if fid == -1, error('Cannot write to %s', outputName); end
fwrite(fid, xmlText, 'char');
fclose(fid);

fprintf('Success! Synchronized XML created: %s\n', outputName);
end