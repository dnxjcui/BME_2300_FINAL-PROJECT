function [freqs, amps] = dominant_frequencies(file_path, electrode)
%% dominant_frequencies.m
%   Given a file_path to a properly formatted mat path, calculate and find
%   dominant intracranial frequencies and return as vector
% Inputs:
%   file_path   : Path to the mat file with the EEG data.
%   electrode   : Electrode data to use; options are:
%                   - P4 (Parietal Lobe)
%                   - Cz (Midline)
%                   - F8 (Frontal)
%                   - T7 (Temporal)
% Outputs:
%   freqs       : Returns frequencies.
%   amps        : Returns relative amplitudes of each peak, can use for
%                 comparison later.

load(file_path);

if (electrode == "P4")
    elect = P4;
elseif (electrode == "Cz")
    elect = Cz;
elseif (electrode == "F8")
    elect = F8;
elseif (electrode == "T7")
    elect = T7;
else 
    disp("Please select a valid electrode: P4, Cz, F8, T7")
    quit;
end

fs = 200;               % Sampling Frequency (Hz)
T = 1/fs;               % Period
L = length(elect) * T;  % Length of signal (s)
t = 0:T:L;              % Time vector

fig1 = figure('visible', 'off');

plot(t(1:end - 1), elect); % Plotting electrode readings against time

fig2 = figure('visible','off');
transformed_elect = fft(elect);                             % Performing transform
transformed_elect = abs(transformed_elect(1:(L*fs/2)));     % Throwing away second half and taking absolute value
f = (0:(L * fs)/2 - 1) / L;                                 % Creating frequency vector

plot(f, transformed_elect); % Plotting the transform in the Frequency domain

window = ceil(max(f));  % window

b = (1/window)*ones(1,window);
a= 1;
filtered = filter(b, a, transformed_elect);    % filtering data
filtered_2 = filter(b, a, filtered);    % filtering data again

[amps, locs] = findpeaks(filtered_2,'MinPeakProminence',max(filtered_2)/10); % using prominence of arbitrary number

freqs = locs/length(filtered_2) * window;

end