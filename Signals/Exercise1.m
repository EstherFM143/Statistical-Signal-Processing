%EXERCISE 1-assgn 2

%task 1
% 2x2 covariance with non-zero off-diagonals
Sigma = [2.0, 0.5;
         0.5, 3.0];
disp('Σ =');
disp(Sigma);

%task 2
% white Gaussian random vector w (2 x 1000), zero mean, identity cov
N = 1000;
w = randn(2, N);

%task 3 ... cholesky decomposition
L = chol(Sigma, 'lower');
disp('Lower triangular matrix');
disp(L);

%task 4 .. map w to new Gaussian x
x = L * w;

%task 5 ... sample cov matrix, cov matrix = sigma
Sample_cov = cov(x'); 
disp('Sample covariance matrix')
disp(Sample_cov)

diff = Sample_cov - Sigma;  %difference
disp('Difference')
disp(diff)

fro_norm_diff = norm(diff, 'fro');  %frobernius norm of diff.
max_abs_diff = max(abs(diff(:)));   %max absolute diff.
rel_error = fro_norm_diff / norm(Sigma, 'fro');  %relative error
disp('Relative error')
disp(rel_error)