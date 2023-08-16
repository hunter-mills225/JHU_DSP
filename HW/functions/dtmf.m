function [x,Fs] = dtmf(phone_num)
% dtmf(phone_num)
%
% phone_num is a vector containing the number to be called.
% "*" and "#" are represented as "-1" and "-2", respectively.

Fs = 8000;
T = 0.25;
tau = 0.05;

N = length(phone_num);
tt = (0:1/Fs:T)';
K = length(tt);
M = round(Fs*(T+tau));

x = zeros(ceil(N*Fs*(T+tau)),1);

for n = 1:N
   index = ((n-1)*M + 1:(n-1)*M + K);
   
   switch phone_num(n)
   case 1
      x(index) = x(index) + sin(2*pi*697*tt) + sin(2*pi*1209*tt);
   case 2
      x(index) = x(index) + sin(2*pi*697*tt) + sin(2*pi*1336*tt);
   case 3
      x(index) = x(index) + sin(2*pi*697*tt) + sin(2*pi*1477*tt);
	case 4
      x(index) = x(index) + sin(2*pi*770*tt) + sin(2*pi*1209*tt);
	case 5
      x(index) = x(index) + sin(2*pi*770*tt) + sin(2*pi*1336*tt);
	case 6
      x(index) = x(index) + sin(2*pi*770*tt) + sin(2*pi*1477*tt);
	case 7
      x(index) = x(index) + sin(2*pi*852*tt) + sin(2*pi*1209*tt);
	case 8
      x(index) = x(index) + sin(2*pi*852*tt) + sin(2*pi*1336*tt);
	case 9
      x(index) = x(index) + sin(2*pi*852*tt) + sin(2*pi*1477*tt);
   case -1
      x(index) = x(index) + sin(2*pi*941*tt) + sin(2*pi*1209*tt);
	case 0
      x(index) = x(index) + sin(2*pi*941*tt) + sin(2*pi*1336*tt);
   case -2
      x(index) = x(index) + sin(2*pi*941*tt) + sin(2*pi*1477*tt);
   otherwise
      disp('unknown number');
   end
   
end

soundsc(x,Fs)