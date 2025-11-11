clear;
%Exercise 3 task 1
% Given parameters
N       = 1e5;        % number of samples
sigma2u = 0.5;        % variance of AWGN input
fs      = 1;          % sampling frequency for PSD
win     = 1024;       % pwelch window length (Hamming by default when scalar)
ovlp    = 512;        % overlap
nfft    = 1024;       % FFT length

%generate signal u[n] AWGN
u = sqrt(sigma2u) * randn(N,1); %uses standard deviation, sqrt(var)
[Pu, Fu] = pwelch(u, win, ovlp, nfft, fs);

figure;
subplot(3,1,1);
plot(Fu, 10*log10(Pu));
grid on; 
xlabel('Frequency (Hz)'); 
ylabel('Power Spectral Density (dB/Hz)');
title('PSD of Input u[n](AWGN)');

%TASK 2
a1 = -0.9;
b  = 1;         % numerator of H(z)
a  = [1 a1];    % denominator of H(z) = 1 / (1 + a[1]*z^{-1})

%filter the signal and plot signal w[n]
w = filter(b, a, u);
[Pw, Fw] = pwelch(w, win, ovlp, nfft, fs);

subplot(3,1,2);
plot(Fw, 10*log10(Pw));
grid on; xlabel('Frequency (Hz)'); ylabel('PSD (dB/Hz)');
title('PSD of Output w[n]');

subplot(3,1,3);
plot(Fw, 10*log10(Pw), 'r'); hold on;
plot(Fu, 10*log10(Pu), 'b--'); % overlay u[n] for comparison
grid on; xlabel('Frequency (Hz)'); ylabel('PSD (dB/Hz)');
title('Output w[n] vs. input u[n]');
legend('w[n]', 'u[n]', 'Location','best');


