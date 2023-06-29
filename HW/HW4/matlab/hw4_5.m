%!-------------------------------------------------------------------------
%! DSP HW4 #5
%!  - Generate a pulsed sine wave with f=10kHz and pulse width of .5ms
%!      starting at 0 and ending at T-stop
%!  - Sample the analog signal with Ts=.01ms
%!  - Compute and display the magnitude of the DTFT
%!-------------------------------------------------------------------------

%! Enviorment
t_stop = [.001, .005];
f = 10000;
pulse_width = .0005;

for i=1:length(t_stop)
    t = 0:.000001:t_stop(i); % Analog sample times
    sample_rate = .00001/.000001;
    n = t(1:int32(sample_rate):end);
    w = linspace(0, pi, length(n));
    
    % Signal
    xt = sin(2*pi*f*t) .* ((t - pulse_width) <= 0);
    xn = sin(2*pi*f*n) .* ((n - pulse_width) <= 0);
    
    % Plot time domain signals
    figure((i-1)*2+1)
    subplot(2,1,1)
    plot(t, xt)
    xlabel('Time (ms)')
    ylabel('Amplitude')
    title('Analog Signal')
    subplot(2,1,2)
    stem(n, xn)
    xlabel('Time (ms)')
    ylabel('Amplitude')
    title('Sampled Signal')

    % Take DTFT
    n = n * 100000;
    xf = dtft(xn, n, w);
    figure((i-1)*2+2)
    plot(w, abs(xf))
    xlabel('w')
    ylabel('|X(w)|')
    title('Magnitude of X(w)')
end

disp(['The major frequency component is at w = .628319 rad/sample which ' ...
    'translates to F = 10kHz with f = F/Fs and Fs = 100000kHz. It looks like there is ' ...
    'a minor peak about every 2000Hz which most likely comes from the step' ...
    'function. The DTFT of the signals look pretty much the same as eachother.'])