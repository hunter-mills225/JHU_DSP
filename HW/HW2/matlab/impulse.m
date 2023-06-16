function [x,n] = impulse(n0,n1,n2)

% Generates x(n) = delta(n-n0); n1 <= n,n0 <= n2

n = n1:n2;

%x = [zeros(1,(n0-n1)), 1, zeros(1,(n2-n0))];

x = (n-n0) == 0;

