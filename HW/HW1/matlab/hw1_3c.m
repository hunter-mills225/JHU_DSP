% DSP HW1 #3d
clear; close all;

% Variables
n = linspace(0, 5, 6);
t_n = n ./ 300;
%t_a = linspace(0, 6, 100) ./ 300;

t = linspace(0, 100, 1000) ./ 50;

% Functions
%x_n = 3 * sin(pi * n / 3);
%x_a = 3 * sin(100 * pi * t_a)
x_a = 3 * cos(5*t+pi/6);

% Plot
hold on
%stem(t_n, x_n)
plot(t, x_a)
ylabel('Amplitude')
xlabel('Time')
legend('Samples', 'Analog')
hold off