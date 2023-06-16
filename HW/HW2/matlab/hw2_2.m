% DSP HW2 #2
clear; close all;

% Variables
n = linspace(-10, 10, 21);
indexs = 8:14;
delay = 6; 

% Function
x_n = zeros(21, 1);             % Create array to hold x(n)
x_n(8:10) = 1 + n(8:10) ./ 3;   % Solve for -3 le n le -1
x_n(11:14) = 1;                 % Solve for 0 le n le 3

% Plot
figure(1)
stem(n, x_n)
xlabel('Samples')
ylabel('x(n)')
title('Plot of 1A')

% 2B(i)
x_n_b1_pre_delay = flip(x_n);                       % Flip the array first                   
x_n_b1 = zeros(21, 1);          
x_n_b1(indexs+delay) = x_n_b1_pre_delay(indexs);    % Delay values

figure(2)
stem(n, x_n_b1)
xlabel('Samples')
ylabel('x(n)')
title('Plot of 1B(i)')

% 2B(ii)
x_n_b2 = zeros(21, 1);    
x_n_b2(indexs+delay) = x_n_b1_pre_delay(indexs);    % Delay values
x_n_b2 = flip(x_n_b2);                              % Flip the array first

figure(3)
stem(n, x_n_b2)
xlabel('Samples')
ylabel('x(n)')
title('Plot of 1B(ii)')

% 2C
x_n_c_pre_delay = flip(x_n);                        % Flip the array first                   
x_n_c = zeros(21, 1); 
delay = 3;
x_n_c(indexs+delay) = x_n_c_pre_delay(indexs);      % Delay values

figure(4)
stem(n, x_n_c)
xlabel('Samples')
ylabel('x(n)')
title('Plot of 1C')

% 2E
% Use impulse and unit_step that are derived from DSP m-file Help Manual
x_n = impulse(-2,-10, 10) ./3 + 2 .* impulse(-1,-10,10) ./ 3 + ...
                unit_step(0,-10,10) - unit_step(4, -10, 10);

% Plot
figure(5)
stem(n, x_n)
xlabel('Samples')
ylabel('x(n)')
title('Plot of 1E')






