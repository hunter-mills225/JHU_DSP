%!-------------------------------------------------------------------------
%! DSP HW8 #4a
%!  - Create filter with .5dB ripple in passband, 60dB ripple in stopband,
%!      a passband edge freq of .25pi and a stopband edge freq of .3pi
%!  - Document the coefficients and plot the log magnitude with freqz.m
%!-------------------------------------------------------------------------

%! Enviorment
wp = .25*pi;
ws = .3*pi;
ripple_pb = .5;
ripple_sb = 60;

%! Create filter
[N, Wn] = ellipord(wp/pi, ws/pi, ripple_pb, ripple_sb);
[b, a] = ellip(N, ripple_pb, ripple_sb, Wn);

%! Plot
freqz(b, a)