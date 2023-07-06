%!-------------------------------------------------------------------------
%! DSP HW5 #5
%!  - Create signal with three sinusiod and a noise component
%!  - Display the magnitude for two different window functions
%!  - Comment on displayed results
%!-------------------------------------------------------------------------

%! Enviorment
Fs = 200000;
Ts = 1/Fs;
f1 = 46000;
f2 = 46380;
f3 = 54000;
a1 = 1;
a2 = .4;
a3 = .002;
variance = 10e-5;
n = 0:1023;

% Singal
x = a1*cos(2*pi*f1*Ts*n) + a2*cos(2*pi*f2*Ts*n) + a3*cos(2*pi*f3*Ts*n);
noise = variance*randn(1,1024);
x = x + noise;

% Window
bartlet_window = zeros(1, 1024);
bartlet_window(1:512) = n(1:512) / 512;
bartlet_window(513:end) = (1024 - n(513:end)) / 512;
x_window = x .* bartlet_window;

% FFT
xf = fftshift(abs(fft(x)));
xf_window = fftshift(abs(fft(x_window)));

% Plot
f = (-512:511)*Fs/length(n);
subplot(2,1,1)
plot(f, 10*log(xf))
title('Magnitude of FFT for x(n) with rectangular pulse from n=0:1023')
ylabel('|X(w)| (dB)')
xlabel('Frequency (Hz)')
subplot(2,1,2)
plot(f, 10*log(xf_window))
title('Magnitude of FFT for x(n) with bartlet window from n=0:1023')
ylabel('|X(w)| (dB)')
xlabel('Frequency (Hz)')

disp(['With the rectangular pulse you can see the three'...
'frequencies in the magnitude of the spectrum. In the'...
'magnitude of the spectrum windowed with the barlet function'...
'you can really only see the main wave and the wave at f3.'...
'When windowed with barlet you can also see more noise in the spectrum.'])