%!-------------------------------------------------------------------------
%! DSP HW11 #1
%!  - Create sampled signal x[n] = sin[2*pi*f1*n*Ts] + sin[2*pi*f2*n*Ts]
%!  - Plot samples 500:560 and plot the DTFT
%!  - Upsample by 4 and display results
%!-------------------------------------------------------------------------

%! Enviorment
clear; close all;
addpath([fileparts(mfilename('fullpath')), '/../../functions']);

%! Variables
Fs      = 4000;
Ts      = 1/Fs;
f1      = 100;
f2      = 450;
N       = 2048;
n       = 0:N-1;
n_plot  = 500:560;
w       = (-2000:2000)*pi/1000;
d_samp  = 4;

%! Create Signals
x_n = sin(2*pi*f1*n*Ts) + sin(2*pi*f2*n*Ts);
x_downsample = downsample(x_n, d_samp);

%! Downsample variables
m = n(1)/4 : n(end)/4;
m_plot = 125:140;
w_downsample = w(1:4:end);

%! Take DTFT of singals
x_f         = dtft(x_n, n, w) / N;
x_f_down    = dtft(x_downsample, m, w) / N; 

%! Plot
figure()
subplot(2,1,1)
stem(n_plot, x_n(n_plot))
title('Output Signal')
xlabel('Sample')
ylabel('Amp')
subplot(2,1,2)
plot(w/pi, fftshift(abs(x_f)))
title('DTFT of x[n]')
xlabel('Normalized frequency (w/pi)')
ylabel('|Amp|')

figure()
subplot(2,1,1)
stem(m_plot, x_downsample(m_plot))
xlim([m_plot(1),m_plot(end)])
title('Output Signal')
xlabel('Sample')
ylabel('Amp')
subplot(2,1,2)
plot(w/pi, fftshift(abs(x_f_down)))
title('DTFT of Downsampled x[n]')
xlabel('Normalized frequency (w/pi)')
ylabel('|Amp|')
