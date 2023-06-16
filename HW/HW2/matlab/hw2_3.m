% DSP HW2 #3

% Enviorment
n = -6:6;
x = [2, 1, 1, 0, 0, 1, 1, 1, 1, .5, .5, 0, 0];

% Part G, calc + plot even part of x(n)
% x_even = .5[x(n) + x(-n)]
x_even = .5 .* (x + flip(x));

% Part H, calc + plot odd part of x(n)
% x_odd = .5[x(n) - x(-n)]
x_odd = .5 .* (x - flip(x));

% Plot even and odd singals
figure(1);
plot(n, x_even)
xlabel('Samples')
ylabel('x(n)')
title('Even part of x(n)')
figure(2)
plot(n, x_odd)
xlabel('Samples')
ylabel('x(n)')
title('Odd part of x(n)')

% Part I, calculate x(n) from even and odd
% x(n) = x_even + x_odd
x_calc = x_even + x_odd;

% Plot x(n) calculated from even and odd parts
figure(3);
stem(n, x_calc)
xlabel('Samples')
ylabel('x(n)')
title('x(n) calculated from even and odd parts')
