# Exercise 4: Exercise 3 using Python

import numpy as np
import matplotlib.pyplot as plt

# Parameters
A_true = 2
B_true = 3
C_true = 5
omega = 0.5             
sigma = np.sqrt(0.5)  # Standard deviation for N(0,0.5)
N = 64
n = np.arange(N) 

# 1. Generate the signal y[n] 
np.random.seed(42)      # reproducibility
w = sigma * np.random.randn(N)
y = A_true + B_true*n + C_true*np.sin(omega*n) + w

# 2. Create the design matrix X
X = np.column_stack([np.ones(N), n, np.sin(omega*n)])

# 3. Estimate weights w_hat
w_hat = np.linalg.inv(X.T @ X) @ (X.T @ y)
print(f"Estimated weight w_hat = {w_hat}") 

# 4. Generate estimated signal y_hat
y_hat = X @ w_hat

# 5. Add extra feature exp(n) 
X_exp = np.column_stack([np.ones(N), n, np.sin(omega*n), np.exp(n)])
w_hat_exp = np.linalg.pinv(X_exp) @ y      # pseudo-inverse for stability
y_hat_exp = X_exp @ w_hat_exp
print(f"Estimated signal y_hat = {y_hat}") 

# 6. Compute residuals
res1 = np.linalg.norm(y - y_hat)
res2 = np.linalg.norm(y - y_hat_exp)
print(f"\nResidual norm without exp = {res1}")
print(f"Residual norm with exp     = {res2}")

# Plot results
plt.figure(figsize=(9, 5))
plt.plot(n, y, 'ko-', label='original y[n]')
plt.plot(n, y_hat, 'r--', label='ŷ[n] Estimated y[n]')
plt.plot(n, y_hat_exp, 'b-.', label='ŷ_exp[n] (with exp(n))')
plt.xlabel('Sample(n)')
plt.ylabel('Amplitude')
plt.title('Signal Estimation Comparison')
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.show()
