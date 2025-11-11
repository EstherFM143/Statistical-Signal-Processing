clear;
%Exercise 4 task 1
N = 500; D = 2; variance = 0.5;

% Complex Gaussian CN(0,1): real and imag N(0, 0.5): Rayleigh
% distribution parameter, sqrt(variance) = 1/sqrt(2)
complex_gaus = (randn(N,D) + 1i*randn(N,D)) / sqrt(2);
A = abs(complex_gaus); 

%task 2
%using the formular
mu = mean(A, 1);                 % 1x2 ..mean of each column
Abar = ones(N,1) * mu;           % N x 2 ..row-wise operations
sigma = ((A-Abar)' * (A-Abar)) /(N-1);
disp('sigma')
disp(sigma);

%verification by cov() 
Sigma_cov = cov(A);
disp('sigma_cov')
disp(Sigma_cov);

%task 3 ... svd of A
[U, S, V] = svd(A, 'econ');
s = diag(S); % singular values
disp('singular values of A')
disp(s);

%task 4
Asvd = U * S * V.';
disp('Asvd')
disp(Asvd);

%task 5 ... reconstruction quality, squared Frobernius norm
residual = A - Asvd;
sq_frob = norm(residual, 'fro')^2;
disp('Squared Frobenius norm ||A - Asvd||_F^2');
disp(sq_frob);



