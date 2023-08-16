%!-------------------------------------------------------------------------
%! DSP HW11 #2
%!  - Reconstruct x(t) from x[n]
%!  - Reconstruct x(t) from downsampled x[n]
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
d_samp  = 4;
t_delta = .05;
t       = 0:t_delta:N-1;
t_down  = 0:t_delta:N/4-1;

%! Create Signals
x_n = sin(2*pi*f1*n*Ts) + sin(2*pi*f2*n*Ts);
x_downsample = downsample(x_n, d_samp);

%! Reconstruct orignial signal using sinc method
x = zeros(N, length(t));
for i=1:N
    x(i, :) = x_n(i)*sinc(t-i+1);
end
xa_orig = sum(x);

%! Reconstruct downsampled signal using sinc method
x = zeros(N/4, length(t_down));
for i=1:N/4
    x(i, :) = x_downsample(i)*sinc(t_down-i+1);
end
xa_down = sum(x);

%! Plot
%! Plot 20 digital samples
figure()
stem(n(1:20), x_n(1:20))
title('Analog and Digital (Original Signal)')
xlabel('Sample Time')
ylabel('Amp')
hold on
plot(t(1:20/.05), xa_orig(1:20/.05))
hold off

%! Plot 20 Digital Samples
figure()
stem(n(1:20), x_downsample(1:20))
title('Analog and Digital (Downsampled Signal)')
xlabel('Sample Time')
ylabel('Amp')
hold on
plot(t(1:20/.05), xa_down(1:20/.05))
hold off
