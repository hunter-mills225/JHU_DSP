%!-------------------------------------------------------------------------
%! DSP Midterm 31b
%!  - Calculate 1024-point FFT with a rectangular function, divided
%!      by N, 0-nyquist frequency and doube the spectrum
%!-------------------------------------------------------------------------

%! Enviorment
addpath([fileparts(mfilename('fullpath')), '/../HW/functions']);
Fs = 100000;
n = 0:1024;
f = (-512:511)*Fs/1024;

% Singal
xn = (.5*sin(pi*n/10)+1).*cos(pi*n/2);

% Window
win = unit_step(0,n) - unit_step(1023, n);
x_window = xn .* win;

% FFT
xf = fft(x_window(1:1024));

% Plots
figure(1)
subplot(2,1,1)
plot(f, abs(xf)./length(f))
title('Magnitude FFT/N')
ylabel('|X(w)|')
xlabel('kHz')


subplot(2,1,2)
plot(f(513:end), abs(xf(513:end)))
title('Positive Spectrum')
ylabel('|X(w)|')
xlabel('kHz')

