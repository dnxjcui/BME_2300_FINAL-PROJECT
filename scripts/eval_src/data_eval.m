function [freqs, amps] = data_eval(data_path, experiment, electrode)
%% data_eval.m
%   Given a data_path and experiment number, return all the dominant
%   frequencies that exist.
% Inputs:
%   data_path   : Path to the data
%   experiment  : Experiment number (as a string) i.e. 01, 06, 10
%   electrode   : Electrode data to use; options are:
%                   - P4 (Parietal Lobe)
%                   - Cz (Midline)
%                   - F8 (Frontal)
%                   - T7 (Temporal)
% Outputs:
%   freqs       : All the dominant frequencies existing in this experiment.
%   amps        : All the corresponding amplitudes for each peak.

freqs = [];
amps = [];

file_name = fullfile(data_path, strcat("all_", experiment, ".txt"));

% disp(strcat("Opening: ", file_name));

txtfile = fopen(file_name);

line = fgetl(txtfile);
while ischar(line)
    % disp(strcat("Evaluating file: ", line));
    
    file_path = fullfile(data_path, line);
    [subject_freqs, corresponding_amps] = dominant_frequencies(file_path, electrode);
    
    % Ensures that there will be 5 data points for each entry. Will have to
    % decide about clearing up later. 
    freq_to_add = zeros(1,8);
    amps_to_add = zeros(1,8);
    for i=1:8
        if (length(subject_freqs) < i)
            break;
        end
        freq_to_add(i) = subject_freqs(i);
        amps_to_add(i) = corresponding_amps(i);
    end

    freqs = [freqs; freq_to_add];
    amps = [amps; amps_to_add];

    line = fgetl(txtfile);
end