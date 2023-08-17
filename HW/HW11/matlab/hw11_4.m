%!-------------------------------------------------------------------------
%! DSP HW11 #4
%!  - Create filters to match dtmf frequencies
%!  - Filter the signal
%!  - Decode the phone number
%!-------------------------------------------------------------------------

%! Enviorment
clear; close all; clc;
addpath([fileparts(mfilename('fullpath')), '/../../functions']);
f697    = load("filters/filter697.mat");
f770    = load("filters/filter770.mat");
f852    = load("filters/filter852.mat");
f941    = load("filters/filter941.mat");
f1209   = load("filters/filter1209.mat");
f1336   = load("filters/filter1336.mat");
f1477   = load("filters/filter1477.mat");
filter_LP = load("filters/filter_LP.mat");

%! Phone Number
phone_num = [1 2 3 4 5 6 7 8 9 0];

%! Call dtmf
[x, Fs] = dtmf(phone_num);

%! Filter the phone signal with each of the filters
%   This creates 7 signals each with a single frequency range
y697    = filter(f697.Num, f697.Den, x);
y770    = filter(f770.Num, f770.Den, x);
y852    = filter(f852.Num, f852.Den, x);
y941    = filter(f941.Num, f941.Den, x);
y1209   = filter(f1209.Num, f1209.Den, x);
y1336   = filter(f1336.Num, f1336.Den, x);
y1477   = filter(f1477.Num, f1477.Den, x);

%! Take power and find if power is above threshold
%   If the power in a range of the signal is greater than the threshold
%   set that range to 1.
y = zeros(7, length(x));
y697out = filter(filter_LP.Num, filter_LP.Den, y697.^2);
y(1,:) = double(y697out > .3);
y770out = filter(filter_LP.Num, filter_LP.Den, y770.^2); 
y(2,:) = double(y770out > .3);
y852out = filter(filter_LP.Num, filter_LP.Den, y852.^2); 
y(3,:) = double(y852out > .3);
y941out = filter(filter_LP.Num, filter_LP.Den, y941.^2); 
y(4,:) = double(y941out > .3);
y1209out = filter(filter_LP.Num, filter_LP.Den, y1209.^2); 
y(5,:) = double(y1209out > .3);
y1336out = filter(filter_LP.Num, filter_LP.Den, y1336.^2); 
y(6,:) = double(y1336out > .3);
y1477out = filter(filter_LP.Num, filter_LP.Den, y1477.^2); 
y(7,:) = double(y1477out > .3);

%! Downsample the y vectors
%   Get one sample per symbol
d = zeros(7, 10);
for i=1:7
    d(i,:) = downsample(y(i,:), 2500, 700);
end

% Array for the phone number pad
phone_num_arr = [1 2 3;
                 4 5 6;
                 7 8 9;
                -1 0 -2];
num=zeros(1,length(x)/2400);
for i=1:10
    idx = find(d(:,i) == 1);    % Find idx where the power is > thresh
    row = idx(1);
    col = idx(2)-4;
    num(1,i) = phone_num_arr(row, col);
end

disp(' ')
disp([' Transmitted Data = ',num2str(num)])

% Plots
figure()
freqz(f697.Num, f697.Den)
title('Frequency Response of BPF for 697Hz')
figure()
freqz(f770.Num, f770.Den)
title('Frequency Response of BPF for 770Hz')
figure()
freqz(f852.Num, f852.Den)
title('Frequency Response of BPF for 852Hz')
figure()
freqz(f941.Num, f941.Den)
title('Frequency Response of BPF for 941Hz')
figure()
freqz(f1209.Num, f1209.Den)
title('Frequency Response of BPF for 1209Hz')
figure()
freqz(f1336.Num, f1336.Den)
title('Frequency Response of BPF for 1336Hz')
figure()
freqz(f1477.Num, f1477.Den)
title('Frequency Response of BPF for 1477Hz')

figure()
subplot(7,1,1)
plot(y697)
subplot(7,1,2)
plot(y770)
subplot(7,1,3)
plot(y852)
subplot(7,1,4)
plot(y941)
subplot(7,1,5)
plot(y1209)
subplot(7,1,6)
plot(y1336)
subplot(7,1,7)
plot(y1477)
xlabel('Samples')

figure()
for i=1:7
    subplot(7,1,i)
    plot(y(i,:))
end
  








