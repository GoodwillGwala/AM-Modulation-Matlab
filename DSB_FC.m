%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% #! bin/octave %
% Author: Goodwill Gwala (674390) %
% Date: 31/07/2020 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Code Details: 
% Double-tone injection
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [time_domain, frequency_spectra] = DSB_FC(f_c, f_m1, f_m2, f_s, A_m1, A_m2, Ac, numsamples, mod_index)
  
t_s = 1/f_s;  
t = 0:t_s:numsamples/f_s-t_s;
mn_index = 3.252; %worked out by hand

mn_t = (A_m1/mn_index)*cos(2*pi*f_m1*t) + (A_m2/mn_index)*sin(2*pi*f_m2*t) ;


c_t = Ac*cos(2*pi*f_c*t);
u_t = c_t + mod_index*mn_t.*c_t; %  u(t) = Ac[1+am(t)]cos2*pi*f_c*t

U_f = fftshift(abs(fft(u_t)))/numsamples;
f = (-numsamples/2:numsamples/2-1)*f_s/numsamples;

time_domain=figure;
plot(t,u_t)
grid on;
xlabel('Time ')
ylabel ('Magnitude')
xlim([0 3*1/f_m2])
heading = strcat({'Time domain representation of DSB AM with  Modulation index of '}, num2str(mod_index*100), '%');
title(heading)

frequency_spectra=figure;
%heading = strcat({'Frequency Spectra of AM Modulation with Modulation index of '}, num2str(mod_index*100), '%');
plot(f,abs(U_f))
grid on;
xlabel ('Frequency (Hz)')
ylabel ('Magnitude')
heading = strcat({'Frequency spectrum of DSB-FC modulated signal with modulation index of '}, num2str(mod_index*100), '%');
title(heading)
xlim([-2*f_c 2*f_c])



U_f = fftshift(angle(fft(u_t)))/numsamples;
tol = 1e-6;
U_f(abs(U_f) < tol) = 0;
theta = angle(U_f);
phase_spectra=figure;
%heading = strcat({'Frequency Spectra of AM Modulation with Modulation index of '}, num2str(mod_index*100), '%');
stem(f,theta/pi)
grid on;
xlabel ('Frequency (Hz)')
ylabel ('Phase')
heading = strcat({'Phase spectrum of DSB-FC modulated signal with modulation index of '}, num2str(mod_index*100), '%');
title(heading)



end
