%!-------------------------------------------------------------------------
%! DSP HW11 #3
%!  - Create x[n] and upsample
%!  - Design a filter for the upsampled signal
%!  - Display and compare the two singals
%!-------------------------------------------------------------------------

%! Enviorment
clear; close all; clc;
addpath([fileparts(mfilename('fullpath')), '/../../functions']);
coeff = load("filters/coeff_3.mat");

%! Variables
Fs      = 1000;
Ts      = 1/Fs;
f1      = 100;
f2      = 450;
N       = 2048;
n       = 0:N-1;
up_samp = 4;
n_plot  = 125:141;
w       = (-2000:2000)*pi/1000;

%! Create Signals
x_n = sin(2*pi*f1*n*Ts) + sin(2*pi*f2*n*Ts);
y_n = upsample(x_n, up_samp);

%! LFP
y_m = filter(coeff.Num, 1, y_n);

%! Take DTFT
x_f = dtft(x_n, n, w) / N;
y_f = dtft(y_n, 0:N*up_samp-1, w) / (N*up_samp);
ym_f = dtft(y_m, 0:N*up_samp-1, w) / (N*up_samp);

%! Plot
figure()
subplot(2,1,1)
stem(n_plot, x_n(n_plot))
title('Time Domain x[n]')
xlabel('Sample')
ylabel('Amp')
subplot(2,1,2)
plot(w/pi, abs(x_f))
title('Specrum of x[n]')
ylabel('Mag')
xlabel('Normalized Freuqency (w/pi)')

figure()
y_plot = n_plot(1)*4:n_plot(end)*4;
subplot(2,1,1)
stem(y_plot, y_n(y_plot))
title('Time Domain y[n]')
xlabel('Sample')
ylabel('Amp')
subplot(2,1,2)
plot(w/pi, abs(y_f))
title('Specrum of y[n]')
ylabel('Mag')
xlabel('Normalized Freuqency (w/pi)')

figure()
freqz(coeff.Num)

figure()
y_plot = n_plot(1)*4:n_plot(end)*4;
subplot(2,1,1)
stem(y_plot, y_m(y_plot))
title('Time Domain y[m]')
xlabel('Sample')
ylabel('Amp')
subplot(2,1,2)
plot(w/pi, abs(ym_f))
title('Specrum of upsampled and filtered y[m]')
ylabel('Mag')
xlabel('Normalized Freuqency (w/pi)')

disp(["The new upsampled signal y[m]'s spectrum is the same as the origianl signal in",
    "problem 1. The only differences I have noticed is that a slight phase shift in the",
    "time damain signal."])