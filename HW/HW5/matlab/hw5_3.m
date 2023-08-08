%!-------------------------------------------------------------------------
%! DSP HW5 #3
%!  - Compute DTFT of x(n)
%!  - Take 10-pt DFT and 200-pt DFT
%!  - Plot and comment of differences
%!-------------------------------------------------------------------------

%! Enviorment
addpath([fileparts(mfilename('fullpath')), '/../../functions']);
n = 0:199;
w = (0:199)*pi/100;

%! Signal
x = zeros(200, 1);
x(1:50) = n(1:50) + 1;
x(51:100) = 100-n(51:100);

% DTFT and DFT
x_dtft = dtft(x, n, w);
y1k = x_dtft(1:20:200);    % 10-pt DFT
y2k = x_dtft;              % 200-pt DFT

% IDFT
y1 = idft(y1k, 10);
y2 = idft(y2k, 200);

% Plot
figure(1)
subplot(2,1,1)
stem(0:9, abs(y1))
title('Magnitude y1(n)')
subplot(2,1,2)
stem(0:9, angle(y1))
title('Phase')

figure(2)
subplot(2,1,1)
stem(0:199, abs(y2))
title('Magnitude y2(n)')
subplot(2,1,2)
stem(0:199, angle(y2))
title('Phase')

% Comment on DFT
disp(['Since the DFT in part a is only N=10 and L=100, the signal y1(n) cannot be reconstructed' ... 
'into x(n), but since the DFT in part b is N=200 and L=100 N > L and the signal y2(n) can be reconstructed into x(n)'])
