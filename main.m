clc
close all


%Exercise 1b
f_m = 15*10^3;                         %Frequency of message signal
f_c = 2.5*10^6;                       %Frequency of carrier signal
f_s = 2*f_c;                          %Samplingf requency     
                     
Ac = 1;                               %Amplitude of carrier signal
Am = 1;                               %Amplitude of messanger signal
numsamples = 10^5;                    %Number of samples 
DSB_SC(f_c,f_m,f_s, Am, Ac, numsamples)%DSB-SC modulation with characteristics above



%Exercise 2

A_m1 = 2;                             %Amplitude of message 1 signal
A_m2 = 3;                             %Amplitude of message 2 signal
f_m1 = 200*pi / 2*pi ;                %Frequency of  message 1 signal
f_m2 = 400*pi / 2*pi;                 %Frequency of message 2 signal
mod_index = 0.8;                      %Modulation Index
f_c = 2*10^6;                         %Frequency of carrier signal
f_s = 2*f_c;                          %Sampling frequency
numsamples = 10^5;                    %Number of samples 



%Exercise 2c

DSB_FC(f_c,f_m1, f_m2,f_s, A_m1, A_m2, Ac, numsamples, mod_index)   %DSB-FC modulation with 80% modulation



