%!-------------------------------------------------------------------------------------------------
%! DSP HW4 #4
%!  - Plot magnitude and phase of H(w)
%!-------------------------------------------------------------------------------------------------

%! Enviorment
w = (-100:100)*pi/100;    % -pi:pi

% Signal
h = (1 - exp(-1j*w) + exp(-2j*w)) ./ ...
    (1 - .95*exp(-1j*w) + .9025*exp(-2j*w));

% Plot
subplot(2,1,1)
plot(w, abs(h))
title('Magnitude of H(w)')
ylabel('|H(w)|')
xlabel('w')
subplot(2,1,2)
plot(w, angle(h))
title('Phase of H(w)')
ylabel('angle')
xlabel('w')
