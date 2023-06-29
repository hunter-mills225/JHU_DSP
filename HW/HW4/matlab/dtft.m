function X=dtft(x,n,w)
%Computes Discrete-time Fouruer Transform
%X=dtft(x,n,w)
%
%X = dtft row vector of complex values computed at w angular frequencies
%x = finite duration sequence (row vector of complex numbers)
%n = sample number (+/- integers) row vector
%w = angular frequency/sample (+/- radians/sample) row vector

%initially makes sure vectors are in row matrix form
x=x(:);
x=x.';
n=n(:);
n=n.';
w=w(:);
w=w.';

%Compute DTFT as matrix produce
W=exp(-j*w.'*n);  % compute DTFT kernel
X=W*(x.');        % compute DTFT as column vector
X=X.';            % scalar transpose to convert X to a row vectorw vector