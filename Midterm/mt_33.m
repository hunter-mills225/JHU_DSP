%!-------------------------------------------------------------------------
%! DSP Midterm 33
%!  - Compute x(n) = delta(n) + delta(n-4) conv
%!      y(n) = u(n) - u(n-3) using properties of FT
%!-------------------------------------------------------------------------

%! Enviorment
n = 0:31;

% Singal
x = impulse(0, n) + impulse(4, n);
y = unit_step(0, n) - unit_step(3, n);

% FFT
yf = fft(y);
xf = fft(x);
hf = xf .* yf;

% IFFT
h = ifft(hf);

% Plot
figure(1)
stem(n, h)
title('x(n) conv y(n)')
xlabel('samples')
ylabel('Mag')


