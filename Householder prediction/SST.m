function [x] = SST(A, b)
  [n m] = size(A);
  x = zeros(min(n, m), 1);
  for i = min(n, m): -1: 1
    sum = A(i, i + 1: min(n, m)) * x(i + 1: min(n, m));
    x(i) = (b(i) - sum) / A(i, i);
  endfor
end
    