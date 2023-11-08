%% Import data from text file
% Script for importing data from the following text file:
%
%    filename: C:\Users\Olga\Trainig\CoupledOscillator231107\c_1.txt
%
% Auto-generated by MATLAB on 08-Nov-2023 07:43:07

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 6);

% Specify range and delimiter
opts.DataLines = [2, Inf];
opts.Delimiter = "\t";

% Specify column names and types
opts.VariableNames = ["VarName2", "times2", "countA1", "countB1", "countC1", "countD1"];
opts.VariableTypes = ["double", "double", "double", "double", "string", "string"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, ["countC1", "countD1"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["countC1", "countD1"], "EmptyFieldRule", "auto");

% Import the data
tbl = readtable(file_to_load, opts);

%% Convert to output type
VarName2 = tbl.VarName2;
times2 = tbl.times2;
countA1 = tbl.countA1;
countB1 = tbl.countB1;
countC1 = tbl.countC1;
countD1 = tbl.countD1;

%% Clear temporary variables
clear opts tbl