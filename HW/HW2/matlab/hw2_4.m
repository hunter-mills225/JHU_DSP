% DSP HW2 #4
% Show delta(n) + delta(n-1) = u(n) - u(n-2)

% Calculate delta equation
delta_eqn = impulse(0, -4, 4) + impulse(1, -4, 4);

% Calculate unit step equation
step_eqn = unit_step(0, -4, 4) - unit_step(2, -4, 4);

% Show they are equal
equal = delta_eqn - step_eqn;

figure(1)
plot(-4:4, equal)
xlabel('Samples')
ylabel('Amp')
title('delta(n) + delta(n-1) - (u(n) - u(n-2))')