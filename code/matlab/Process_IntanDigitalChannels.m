function [digital_on,digital_off] = Process_IntanDigitalChannels(path_digi)
% function gives out the digital inputs as raw datapoints.
% Documentation for Intantech data file formats: http://intantech.com/files/Intan_RHD2000_data_file_formats.pdf
%
% INPUT
% path_digi: full path to the digital dat file
%
% OUTPUTS
% [digital_on,digital_off]: State changes for each digital channel as a cell structure
%
% By Peter Petersen
% petersen.peter@gmail.com

if ~exist(path_digi)
    error(['Intan Digital Channels file does not exist (' path_digi ')'])
else
    disp('Loading digital channels')
    m = memmapfile(path_digi,'Format','uint16','writable',false);
    digital_word2 = double(m.Data);
    clear m
    Nchan = 16;
    Nchan2 = 17;
    for k = 1:Nchan
        tester(:,Nchan2-k) = (digital_word2 - 2^(Nchan-k))>=0;
        digital_word2 = digital_word2 - tester(:,Nchan2-k)*2^(Nchan-k);
        test = tester(:,Nchan2-k) == 1;
        test2 = test(2:end)-test(1:end-1);
        pulses{Nchan2-k} = find(test2 == 1);
        pulses2{Nchan2-k} = find(test2 == -1);
    end
    digital_on = pulses;
    digital_off = pulses2;
    disp('Loading digital channels: Complete')
end