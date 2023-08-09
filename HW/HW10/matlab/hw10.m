%!-------------------------------------------------------------------------
%! DSP HW10
%!  - Create Hann Bandpass Filter and plot
%!  - Create Hamming Bandstop Filter and plot
%!-------------------------------------------------------------------------

%!--------------------
%! #1
%!--------------------
%! Enviorment
close all; clear;
coeff = load('hw10_1coeff.mat');
L = length(coeff.Num);

%! Windowing
window = hann(L).';
filter = coeff.Num .* window;

% Plot
figure()
stem(0:L-1, window)
title('Hann Window')
ylabel('Amp')
xlabel('Sample')

figure()
freqz(coeff.Num)
title('Designed bandpass Filter without Window')

figure()
freqz(filter)
title('Hann Windowed Bandpass Filter')

%!--------------------
%! #2
%!--------------------
coeff = load('coeff2.mat');

%! Window
L = length(coeff.Num);
window = hamming(L).';
filter = coeff.Num .* window;

% Plot
figure()
stem(0:L-1, window)
title('Hamming Window')
ylabel('Amp')
xlabel('Sample')

figure()
freqz(coeff.Num)
title('Designed Bandstop Filter without Window')

figure()
freqz(filter)
title('Hamming Windowed Bandstop Filter')

