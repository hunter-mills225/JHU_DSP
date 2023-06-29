%!-------------------------------------------------------------------------------------------------
%! DSP HW4 #1
%!  - use dtft.m to compute the magnutude and phase
%!-------------------------------------------------------------------------------------------------

%! Enviorment
n = 0:49;               % 50 samples
w= (-200:200)*pi/100;   % -2pi:2pi

% Signals
x0 = n .* (.9).^n .*(unit_step(0, n) - unit_step(21, n));
x1 = cos(pi/10.*n-pi/4).*(unit_step(0, n) - unit_step(40, n));

% Take Fourier Transform
xf0 = dtft(x0, n, w);
xf1 = dtft(x1, n, w);

% Plot
figure(1)
subplot(2,1,1)
plot(w, abs(xf0))
title('DTFT of 1A')
ylabel('|X(F)|')
xlabel('w')
subplot(2,1,2)
plot(w, angle(xf0))
ylabel('Phase X(F)')
xlabel('w')

figure(2)
subplot(2,1,1)
plot(w, abs(xf1))
title('DTFT of 1B')
ylabel('|X(F)|')
xlabel('w')
subplot(2,1,2)
plot(w, angle(xf1))
ylabel('Phase X(F)')
xlabel('w')

