import numpy as np
import matplotlib.pyplot as plt
from scipy import signal
from scipy.signal import welch

np.random.seed(0)  #random ... for reproducible
# Given parameters
N = int(1e5)
sigma2_u = 0.5 # Variance
fs = 1.0
win = 1024   #window
ovlp = 512   #overlap
nfft = 1024  #FFT length
sigma_u = np.sqrt(sigma2_u)  # Standard deviation

#task 1. Input signal u[n]
u = np.sqrt(sigma2_u) * np.random.randn(N)
Fu, Pu = signal.welch(u, fs=fs, window='hamming', nperseg=win, noverlap=ovlp, nfft=nfft)
# Plot 1: Input signal PSD
plt.figure(figsize=(9, 7))

plt.subplot(2, 2, 1)
plt.plot(Fu, 10*np.log10(Pu))
plt.title('PSD of Input Signal u[n] (AWGN)')
plt.xlabel('Frequency (Hz)')
plt.ylabel('Power Spectral Density (dB/Hz)')
plt.grid(True)

#task 2. Output signal w[n], with a[1]= -0.9
a1 = -0.9
b = [1.0]         # numerator
a = [1.0, a1]     # denominator
w = signal.lfilter(b, a, u)

Fw, Pw = signal.welch(w, fs=fs, window='hamming', nperseg=win, noverlap=ovlp, nfft=nfft)
plt.subplot(2, 2, 2)
plt.plot(Fw, 10*np.log10(Pw), 'r')
plt.title('PSD of Output Signal w[n] (a[1] = -0.9)')
plt.xlabel('Frequency (Hz)')
plt.ylabel('Power Spectral Density (dB/Hz)')
plt.grid(True)

plt.show()




