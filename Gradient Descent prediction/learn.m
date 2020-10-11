function [w] = learn(X, y, lr, epochs)
  [n m] = size(X);
  Ones = ones(n, 1);
  Xtilda = [X Ones];
  for j = 1: m
    col = Xtilda(1: n, j);
    Xtilda(1: n, j) = (col - mean(col)) / std(col);
  endfor
  batch_size = 64;
  w = (rand(m + 1, 1) .- 0.5) ./ 5;
  for epoch = 1: epochs
    indexes = randi([1 n], batch_size, 1);
    Xbatch = Xtilda(indexes, :);
    ybatch = y(indexes);
    for i = 1: m
      sum = (Xbatch(1: batch_size, :) * w - ybatch(1: batch_size))' * Xbatch(1: batch_size, i);
      w(i) = w(i) - lr / n * sum;
    endfor
  endfor
endfunction
