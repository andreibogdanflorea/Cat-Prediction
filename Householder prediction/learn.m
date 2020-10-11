function [w] = learn(X, y)
  [n m] = size(X);
  Ones = ones(n, 1);
  Xtilda = [X Ones];
  [Q R] = Householder(Xtilda);
  w = SST(R, Q' * y);
end
