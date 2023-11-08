
% Undamped

% file_to_load = "C:\Users\Olga\Trainig\HarmonicOscilator231106\ho_mu0.txt";
file_to_load = "C:\Users\Olga\Trainig\HarmonicOscilator231106\ho_mu0_rate_200.txt";

import_data_ho

%%
hf1 = figure;
hax = axes;
plot(hax, times1, countA)
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

%% Springs' stiffness

k1 = dm_k1*g/dL; %[gr/sec^2]
k2 = dm_k2*g/dL; %[gr/sec^2]
k_tot = k1 + k2; %[gr/sec^2]

%% Natural Frequency

omega0 = sqrt(k_tot/mass_c); %[rad]

%%
[pks,locs] = findpeaks(countA);

plot(hax, times1(locs), pks, '^r')

freq_exp = (length(locs) - 1) / (times1(locs(end)) - times1(locs(1))); %[Hz]
omega_exp = 2*pi*freq_exp; %[rad]



