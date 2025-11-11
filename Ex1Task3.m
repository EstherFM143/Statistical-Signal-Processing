% Marginal distributions
P_X_empirical = [sum(X == 0), sum(X == 1)] / N;
P_Y_empirical = [sum(Y == 0), sum(Y == 1)] / N;
disp('Empirical Marginal distribution Px')
disp(P_X_empirical)
disp('Empirical Marginal distribution Py')
disp(P_Y_empirical);

% conditional distribution P(X|Y)
P_X_given_Y = zeros(2,2);   %count variables from task 2
P_X_given_Y(1,1) = count_00 / sum(Y == 0);  % P(X=0|Y=0)
P_X_given_Y(1,2) = count_01 / sum(Y == 1);  % P(X=0|Y=1)
P_X_given_Y(2,1) = count_10 / sum(Y == 0);  % P(X=1|Y=0)
P_X_given_Y(2,2) = count_11 / sum(Y == 1);  % P(X=1|Y=1)
disp('Conditional distribution P(X|Y)')
disp(P_X_given_Y)

disp('Conditional distribution P(X=1|Y=1)')
disp(P_X_given_Y(2,2))
disp('Conditional distribution P(X=0|Y=1)')
disp(P_X_given_Y(1,2))