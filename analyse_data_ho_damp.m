% Damped

%% Clear
close all
clear all
clc

%% Load data cleanup
file_to_load = "C:\Users\Olga\Trainig\HarmonicOscilator231106\ho_mu_max.txt";

import_data_ho

ind = times1 > 0.5;
time = times1(ind);
pos_count = countA(ind);

%%
hf1 = figure;
hax = axes;
plot(hax, time, pos_count)
grid on
hold on
xlabel('time [sec]')
ylabel('counts')

%% Data

mass_c = 215.2; %[gr] mass of the carriage
mass_k1 = 17.6; %[gr] mass of spring 1
mass_k2 = 11.7; %[gr] mass of spring 2
mass_tot = mass_c + mass_k1 + mass_k2;

dL = 97.95; %[mm] length difference for spring stiffness calculation
dm_k1 = 42.7; %[gr] delta force for spring 1
dm_k2 = 68.2; %[gr] delta force for spring 2

num_count = 236; % num of counts on the carriage
leng_c = 123; %[mm] length of carriage

g = 9.81e3; % [mm/sec^2]

%% calculate Springs' stiffness 

k1 = dm_k1*g/dL; %[gr/sec^2]
k2 = dm_k2*g/dL; %[gr/sec^2]
k_tot = k1 + k2; %[gr/sec^2]

%% Calculate Natural Frequency

omega0 = sqrt(k_tot/mass_c); %[rad]

%% Calculate Frequency from experiment
[pks,locs] = findpeaks(pos_count);

plot(hax, time(locs), pks, '^r')

freq_exp = (length(locs) - 1) / (time(locs(end)) - time(locs(1))); %[Hz]
omega_exp = 2*pi*freq_exp; %[rad]

%% Fit exponent function and get damping coeff.

f = fit(time(locs), pks,'exp1');

plot(f)

gamma = -f.b; % damping gamma = c/(2m)

%% Calculate Frequency with damping

Omega = sqrt(omega0^2 - gamma^2);

