%!-------------------------------------------------------------------------------------------------
%! DSP HW4 #2
%!  - Calculate the DTFT, plot and see the difference of longer pulses
%!-------------------------------------------------------------------------------------------------

%! Enviorment
addpath([fileparts(mfilename('fullpath')), '/../../functions']);
n = 0:149;              % 150 Samples
w = (-100:100)*pi/100;    % -pi:pi

% Create Signal
r = zeros(4, length(n));
delay = [10, 25, 50, 101];
for i=1:4
    r(i, :) = unit_step(0, n) - unit_step(delay(i), n);
end

% Take DTFT
rf = zeros(4, length(w));
for i=1:4
    rf(i, :) = dtft(r(i,:), n, w);
    rf(i, :) = rf(i, :) ./ max(abs(rf(i, :)));
end

% Plot
subplot(4,1,1)
plot(w, abs(rf(1,:)))
xlabel('w')
ylabel('Normalized |X(F)|')
title('M=10')

subplot(4,1,2)
plot(w, abs(rf(2,:)))
xlabel('w')
ylabel('Normalized |X(F)|')
title('M=25')

subplot(4,1,3)
plot(w, abs(rf(3,:)))
xlabel('w')
ylabel('Normalized |X(F)|')
title('M=50')

subplot(4,1,4)
plot(w, abs(rf(4,:)))
xlabel('w')
ylabel('Normalized |X(F)|')
title('M=101')

% Comment on the behaviour
disp(['As the number of samples increases the bandwidth range shrinks. The number' ...
    'frequency componets that are a large impact decrease as the wider the pulse is.' ...
    'I think this is since when the pulse is short, it takes a larger amount of frequency' ...
    'to synthesis the curve than it does with longer pulses.'])
