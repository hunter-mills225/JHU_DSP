%!-------------------------------------------------------------------------
%! DSP HW5 #4
%!  - Take 256pt FFT at 100ms, 300ms and 450ms
%!  - Display FFT magnitude for positive frequencies
%!  - Identify frequency bands of interferece
%!-------------------------------------------------------------------------

%! Enviorment
load HW5_Sig    % Sig and Fs
block_size = 128;

% Take FFT
fft_100ms = fft(Sig(6*block_size:7*block_size-1));
fft_300ms = fft(Sig(17*block_size:18*block_size-1));
fft_450ms = fft(Sig(26*block_size:27*block_size-1));

% Plot FFT
f = (0:63)*Fs/block_size;
subplot(3,1,1)
stem(f, fftshift(abs(fft_100ms(65:end))))
title('Frequency Components for 128 Samples Starting at 100ms')
xlabel('Frequency (Hz)')

subplot(3,1,2)
stem(f, fftshift(abs(fft_300ms(65:end))))
title('Frequency Components for 128 Samples Starting at 300ms')
xlabel('Frequency (Hz)')

subplot(3,1,3)
stem(f, fftshift(abs(fft_450ms(65:end))))
title('Frequency Components for 128 Samples Starting at 450ms')
xlabel('Frequency (Hz)')


disp(['The frequency components that should be filtered'...
'out are from about 2750Hz to about 3100Hz, the '...
'impulses from the beep sine waves.'])
