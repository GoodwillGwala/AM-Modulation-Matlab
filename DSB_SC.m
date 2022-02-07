
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% #! bin/octave %
% Author: Goodwill Gwala (674390) %
% Date: 31/07/2020 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Code Details: 
% Single-tone injection
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%% Q1 (b) %%%%%%%%%


function [time_domain, frequency_spectra] = DSB_SC(f_c, f_m, f_s, Am, Ac, samples)


t_s = 1/f_s;  
t = 0:t_s:samples/f_s-t_s;
m_t = Am*cos(2*pi*f_m*t);
c_t = Ac*cos(2*pi*f_c*t);
u_t = m_t.*c_t;

samples = length(u_t);
U_f = fftshift(abs(fft(u_t)))/samples;
f = (-samples/2:samples/2-1)*f_s/samples;

time_domain = figure;
plot(t,u_t);
grid on;
xlabel('Time (s)');
ylabel ('Amplitude');
title('DSB-SC modulated signal');
xlim([0 3*1/f_m]);


frequency_spectra = figure;
plot(f,U_f);
grid on;
xlabel('Frequency (Hz)');
ylabel('Magnitude of DSB AM signal');
title('Frequency spectrum of DSB-SC modulated signal');
xlim([-2*f_c 2*f_c]);


sprintf('Carrier frequency: %d Hz',f_c)
sprintf('Message frequency: %d Hz and %d Hz',f_m)
sprintf('USB spectra at: %d Hz and %d Hz',f_c+f_m)
sprintf('LSB spectra at: %d Hz and %d Hz',f_c-f_m)


