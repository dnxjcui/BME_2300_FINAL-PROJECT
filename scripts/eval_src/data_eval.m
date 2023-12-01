function [freqs] = data_eval(data_path, experiment)
%% data_eval.m
%   Given a data_path and experiment number, return all the dominant
%   frequencies that exist.
% Inputs:
%   data_path   : Path to the data
%   experiment  : Experiment Number
% Outputs:
%   freqs       : All the dominant frequencies existing in this experiment.

file_name = strcat(data_path, "all_", num2str(experiment));

txtfile = fopen(file_name);

line = fgetl(txtfile);
while ischar(line)
    disp(line);
    line = fgetl(txtfile);
end