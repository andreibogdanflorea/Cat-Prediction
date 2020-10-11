function [Q, R] = Householder(A)
  [m n] = size(A);
  Q = eye(m);
  R = A;
  for j = 1: n
    normx = norm(R(j: end, j));
    s = -sign(R(j, j));
    u1 = R(j, j) - s * normx;
    w = R(j: end, j) / u1;
    w(1) = 1;
    tau = -s * u1 / normx;
    R(j: end, :) = R(j: end, :) - (tau * w) * (w' * R(j: end, :));
    Q(:, j: end) = Q(:, j: end) - (Q(:, j: end) * w) * (tau * w)';
   endfor
endfunction