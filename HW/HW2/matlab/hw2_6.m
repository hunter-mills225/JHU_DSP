%!-------------------------------------------------------------------------------------------------
%! DSP HW2 #6
%!  - Show x(n) conv h(n) == h(n) conv x(n)
%!-------------------------------------------------------------------------------------------------

% Enviorment
close all; clear;
x1 = [0, 0, 1, 1, 1, 1, 0];
h1 = [0, 0, 6, 5, 4, 3, 2, 1, 0, 0, 0];
x2 = [0, 0, 1, 1, 1, 1, 0, 0];
h2 = [0, 0, 6, 5, 4, 3, 2, 1, 0, 0, 0, 0];
x3 = [0, 0, 0, 0, 0, 1, 1, 1, 1];
h3 = [0, 1, 1, 0, 0, 0, 0];

% Compute Convolutions
y1_a = conv(x1, h1);
y1_b = conv(h1, x1);
y2_a = conv(x2, h2);
y2_b = conv(h2, x2);
y3_a = conv(x3, h3);
y3_b = conv(h3, x3);

% Plot response of system
figure(1)
subplot(2,1,1)
start_index = -2;                                       % Depends on where the signal starts                                               
n = start_index:start_index+(length(x1)+length(h1)-2);  % n shifts depending on signals
stem(n, y1_a)
title('x1(n) conv h1(n)')
xlabel('Sample')
ylabel('y(n)')
subplot(2,1,2)
stem(n, y1_b)
title('h1(n) conv x1(n)')
xlabel('Sample')
ylabel('y(n)')

figure(2)
subplot(2,1,1)
start_index = -2;
n = start_index:start_index+(length(x2)+length(h2)-2);
stem(n, y2_a)
title('x2(n) conv h2(n)')
xlabel('Sample')
ylabel('y(n)')
subplot(2,1,2)
start_index = -4;
n = start_index:start_index+(length(x2)+length(h2)-2);
stem(n, y2_b)
title('h2(n) conv x2(n)')
xlabel('Sample')
ylabel('y(n)')

figure(3)
subplot(2,1,1)
start_index = -2;
n = start_index:start_index+(length(x3)+length(h3)-2);
stem(n, y3_a)
title('x3(n) conv h3(n)')
xlabel('Sample')
ylabel('y(n)')
subplot(2,1,2)
start_index = -4;
n = start_index:start_index+(length(x3)+length(h3)-2);
stem(n, y3_b)
title('h3(n) conv x3(n)')
xlabel('Sample')
ylabel('y(n)')
