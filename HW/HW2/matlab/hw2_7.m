%!-------------------------------------------------------------------------------------------------
%! DSP HW2 #7
%!  - Given h(n) and y(n) find x(n)
%!-------------------------------------------------------------------------------------------------

% Enviorment
close all; clear;
h = [1, .5, .25, 1/8, 1/16, 0, 0, 0, 0];
y = [1, 2, 2.5, 3, 3, 3, 2, 1, 0];
x = [0,0,0,0,0,0,0,0,0];

% Calculate x(n)
% Highly dependent on y(n) and h(n)
% Solve for x(0) then calculate using the sum and previous values
x(1) = y(1) / h(1);
x(2) = y(2) - (x(1)*h(2));
x(3) = y(3) - (x(2)*h(2) + x(1)*h(3));
x(4) = y(4) - (x(3)*h(2) + x(2)*h(3) + x(1)*h(4));
x(5) = y(5) - (x(4)*h(2) + x(3)*h(3) + x(2)*h(4) + x(1)*h(5));
x(6) = y(6) - (x(5)*h(2) + x(4)*h(3) + x(3)*h(4) + x(2)*h(5));
x(7) = y(7) - (x(6)*h(2) + x(5)*h(3) + x(4)*h(4) + x(3)*h(5));
x(8) = y(8) - (x(7)*h(2) + x(6)*h(3) + x(5)*h(4) + x(4)*h(5));
x(9) = y(9) - (x(8)*h(2) + x(7)*h(3) + x(6)*h(4) + x(5)*h(5));

% Printout Data
disp('x(n) values')
disp(x)
disp('y(n) calculated from x(n) and h(n)')
y_calc = conv(h, x);
disp(y_calc(1:9))
