N = 1e5; % number of samples

% Generate X: P(X=0)=0.7, P(X=1)=0.3
X = rand(1, N) > 0.7; % X=0 if rand<=0.7, else X=1

%generate flips
p = 0.1; % crossover probability
flip = rand(1, N) < p; % flip with probability p
Y = X;  % Start with original bits
Y(flip) = 1 - X(flip);  % Flip only where flip_mask is true

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright","rightPanelPercent":22.6}
%---
