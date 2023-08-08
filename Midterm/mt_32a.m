%!-------------------------------------------------------------------------
%! DSP Midterm 32a
%!  - Plot x(n) = delta(n) + delta(n-4) and
%!      y(n) = u(n) - u(n-3)
%!-------------------------------------------------------------------------

%! Enviorment
addpath([fileparts(mfilename('fullpath')), '/../HW/functions']);
n = 0:10;

% Singal
x = impulse(0, n) + impulse(4, n);
y = unit_step(0, n) - unit_step(3, n);

% Plot
figure(1)
subplot(2,1,1)
stem(n, x)
title('x(n)')
xlabel('samples')

subplot(2,1,2)
stem(n, y)
title('y(n)')
xlabel('samples')
