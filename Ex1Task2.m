% Count occurrences for joint distribution
count_00 = sum(X == 0 & Y == 0);
count_01 = sum(X == 0 & Y == 1);
count_10 = sum(X == 1 & Y == 0);
count_11 = sum(X == 1 & Y == 1);

% Empirical joint distribution
P_XY_empirical = [count_00, count_01; count_10, count_11] / N;
disp(P_XY_empirical) %[output:3494ebf1]

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright","rightPanelPercent":25.7}
%---
%[output:3494ebf1]
%   data: {"dataType":"text","outputData":{"text":"    0.6307    0.0708\n    0.0297    0.2688\n\n","truncated":false}}
%---
