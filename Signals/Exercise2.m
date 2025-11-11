%EXERCISE 2 - assgn 2
% TASK 1

%task 1 - discrete time signal
fs1 = 1;     %sampling frequency
Ts1 = 1/fs1; 
N = 1024;      %no of samples
n = (1:N)';

% discrete time signal x[n] for fs=1Hz
xn_fs1 = 2*cos(0.2*pi.*(n*Ts1)) + 0.5*cos(0.5*pi.*(n*Ts1) + pi/4) + 0.8*cos(0.8*pi.*(n*Ts1) - pi/2);

%Plotting x(n) first
subplot(2,1,1);
stem((n-1)/fs1, xn_fs1);
title('x[n] discrete samples (n=1..1024), fs = 1 Hz');
xlabel('time =n-1 seconds'); ylabel('amplitude');
grid on;
xlim([0 60]);   % zoom first 60 seconds for clarity

%x(t) and its plot
fs_cont = 100;                          % sampling for continuous plot
t_cont = 0:1/fs_cont:(N-1)/fs1;
xt = 2*cos(0.2*pi.*t_cont) + 0.5*cos(0.5*pi.*t_cont + pi/4) + 0.8*cos(0.8*pi.*t_cont - pi/2);

subplot(2,1,2)
plot(t_cont, xt);
xlabel('t (sec)'); 
ylabel('amplitude');
title('x(t) continuous samples, fs=1 Hz');
grid on;
xlim([0 60]);

%fs increase to 2 Hz
fs2 = 2; 
Ts2 = 1/fs2;
xn_fs2 = 2*cos(0.2*pi.*(n*Ts2)) + 0.5*cos(0.5*pi.*(n*Ts2) + pi/4) + 0.8*cos(0.8*pi.*(n*Ts2) - pi/2);

figure;
subplot(2,1,1);
stem((n-1)/fs1, xn_fs1); 
xlabel('time (sec)'); 
title('x[n] sampled at fs=1 Hz'); grid on; xlim([0 60]);

subplot(2,1,2);
stem((n-1)/fs2, xn_fs2); 
xlabel('time (sec)'); 
title('x[n] sampled at fs=2 Hz'); grid on; xlim([0 60]);

%% TASK 2

%task 2a)
w_var = 0;          % zero-variance (N(0,0))
wn = sqrt(w_var)*randn(N,1);  % all zeros
yn = xn_fs1 + wn;

% calculates and plots PSD.... N = 1024 (no of samples)
Y = fft(yn);
f_fft = (0:N-1)*(fs1/N);         % frequency vector 0..fs
psd_fft = abs(Y).^2 / (N * fs1);   %two-sided PSD

figure;
plot(f_fft(1:N/2), 10*log10(psd_fft(1:N/2))); % plot 0..fs/2
title('PSD using FFT (fs=1 Hz)');
xlabel('Frequency (Hz)'); ylabel('PSD (dB)');
grid on;

%task 2b)
figure;
periodogram(yn, [], N, fs1);
title('Periodogram of x[n] (fs=1 Hz)');

%task 2d) .... fs now is 2Hz
figure;
periodogram(yn, [], N, fs2);
title('Periodogram of x[n] (fs=2 Hz)');