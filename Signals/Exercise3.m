% EXERCISE 3

%Task 1
% Parameters
A_true = 2;
B_true = 3;
C_true = 5;
omega = 0.5;
sigma = sqrt(0.5); % Standard deviation for N(0,0.5)

% Generate signal for 64 samples
n = (0:63)';
N = length(n);  % N=64
w_n = sigma * randn(N, 1);

y = A_true + B_true * n + C_true * sin(omega * n) + w_n;

%% task 2
% Design matrix 
X = [ones(N, 1), n, sin(omega * n)];

%% task 3
% weight estimation (X^T X)^-1 X^T y
w_hat = (X'*X) \ (X'*y);

disp('Estimated weights w_hat:');
disp(w_hat);

%% task 4
y_hat = X * w_hat;
disp('estimated signal y_hat');
disp(y_hat)

%% task 5
X_exp = [ones(N,1), n, sin(omega*n), exp(n)]; % Add exp(n) as extra feature

% Estimate weights with exponential feature
w_hat_exp = pinv(X_exp)*y;   % use pseudo-inverse for stability

% Generate estimated signal with exponential feature
y_hat_exp = X_exp * w_hat_exp;


%% task 6

% Main signal plot
figure;
plot(n, y, 'g:', 'LineWidth', 1.5, 'DisplayName', 'Original y[n]'); hold on;
plot(n, y_hat, 'r--', 'LineWidth', 2, 'DisplayName', 'ŷ[n] Estimated y[n]');
plot(n, y_hat_exp, 'b-.', 'LineWidth', 2, 'DisplayName', 'ŷ_{exp}[n] (with exp(n))');
xlabel('Sample (n)');
ylabel('Amplitude');
title('Signal Estimation Comparison');
legend('Location','best');
grid on;

%compare residual errors
res1 = norm(y - y_hat);
res2 = norm(y - y_hat_exp);
disp('Residual norm without exp')
disp(res1)
disp('Residual norm with exp')
disp(res2)


