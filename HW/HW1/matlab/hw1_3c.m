%!-------------------------------------------------------------------------------------------------
%! DSP HW1 #3d
%!  - Compute samples for one period of x(t) = 3sin(100(pi)t)
%!-------------------------------------------------------------------------------------------------

% Enviorment setup
clear; close all;
n = linspace(0, 5, 6);  % Length of one period
t_n = n ./ 300;         % Sample vector to time vector
t_a = linspace(0, 6, 100) ./ 300;   % CT Vector

% Functions
x_n = 3 * sin(pi * n / 3);
x_a = 3 * sin(100 * pi * t_a);

% Plot
hold on
stem(t_n, x_n)
plot(t_a, x_a)
ylabel('Amplitude')
xlabel('Time')
legend('Samples', 'Analog')
hold off
