%EXERCISE 3 TASK 3
fs1 = 1;     %sampling frequency
Ts1 = 1/fs1; 
N = 1024;      %no of samples
n = (1:N)';

% W - N(0,1)   %new signal y[n]
w_var_new = 1;       
wn_3 = sqrt(w_var_new)*randn(N,1);
yn_3 = xn_fs1 + wn_3;

% calculates and plots PSD.... N = 1024 (no of samples)
Y3 = fft(yn_3);
f_fft = (0:N-1)*(fs1/N);         % frequency vector 0..fs
psd_fft = abs(Y3).^2 / (N * fs1);   %two-sided PSD

figure;
plot(f_fft(1:N/2), 10*log10(psd_fft(1:N/2))); % plot 0..fs/2
title('PSD using FFT (fs=1 Hz)');
xlabel('Frequency (Hz)'); ylabel('PSD (dB)');
grid on;

%Periodogram
figure;
periodogram(yn_3, [], N, fs1);
title('Periodogram of new x[n] (fs=1 Hz)');

%% Task 4: Auto-correlation
figure;

% Auto-correlation of w[n]
[w_corr, lags] = xcorr(wn_3, 'coeff');
subplot(2,1,1);
plot(lags, w_corr);
title('Auto-correlation of w[n] ~ N(0,1)');
xlabel('Lag'); ylabel('Correlation Coefficient');
grid on;

% Auto-correlation of y[n]... possible?
[y_corr, lags] = xcorr(yn_3, 'coeff');
subplot(2,1,2);
plot(lags, y_corr);
title('Auto-correlation of y[n]');
xlabel('Lag'); ylabel('Correlation Coefficient');
grid on;

%% TASK 5
% 5-tap FIR filter
num_taps = 5;
fc = 0.3;    % normalized Cutoff frequency
b = fir1(num_taps-1, fc);  %FIR coefficient

% Apply filter
x_filtered = filter(b, 1, xn_fs1);

% Plot results
figure;
subplot(3,1,1);
plot(n, xn_fs1);
title('Original Signal x[n]');
xlabel('Sample n'); ylabel('Amplitude');
xlim([0 60]);
grid on;

subplot(3,1,2);
plot(n, x_filtered);
title('Filtered Signal');
xlabel('Sample n'); ylabel('Amplitude');
xlim([0 60]);
grid on;

% Frequency response
[H, w] = freqz(b, 1, 1024);
f_Hz = w*fs1/(2*pi);

subplot(3,1,3);
plot(f_Hz, 20*log10(abs(H)));
title('FIR Filter Frequency Response');
xlabel('Frequency (Hz)'); ylabel('Magnitude (dB)');
grid on;

% Compare PSD before and after filtering
figure;
subplot(2,1,1);
periodogram(xn_fs1, [], [], fs1);
title('PSD - Before Filtering');

subplot(2,1,2);
periodogram(x_filtered, [], [], fs1);
title('PSD - After Filtering');
