%Exercise 2, task 1
%1st column, zero mean, unit variance
clear;
n = 500;
x = randn (n,1);  %500 samples from N(0,1)

%task 2
%2nd column, 0.5 mean, 2 standard deviation
mu = 0.5; sigma = 2;
y = mu + sigma*randn(n,1);  %500 samples from N(0.5,4)

%task 3
D = [x, y];  % 500 × 2 matrix
C = cov(D);           % matrix covariance 
R = corrcoef(D);      % matrix correlation
disp('Covariance matrix:');
disp(C);

disp('Correlation matrix:');
disp(R);

