%!-------------------------------------------------------------------------------------------------
%! DSP HW2 #4
%!  - Show delta(n) + delta(n-1) = u(n) - u(n-2)
%!-------------------------------------------------------------------------------------------------

% Enviorment setup
close all; clear;
addpath([fileparts(mfilename('fullpath')), '/../../functions']);
n = -4:4;

% Calculate delta equation
delta_eqn = impulse(0, n) + impulse(1, n);

% Calculate unit step equation
step_eqn = unit_step(0, n) - unit_step(2, n);

% Show they are equal
equal = delta_eqn - step_eqn;

figure(1)
plot(-4:4, equal)
xlabel('Samples')
ylabel('Amp')
title('delta(n) + delta(n-1) - (u(n) - u(n-2))')
