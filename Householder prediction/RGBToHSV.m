function HSVmap = RGBToHSV(RGBmap)
  fR = double(RGBmap(:, :, 1)) / 255; fG = double(RGBmap(:, :, 2)) / 255; fB = double(RGBmap(:, :, 3)) / 255;
  pixels = cat(3, fR, fG, fB);
  Cmin = min(pixels, [], 3);
  Cmax = max(pixels, [], 3);
  delta = Cmax - Cmin;
  V = Cmax;
  [N M P] = size(RGBmap);
  H = zeros(N, M); S = H;
  condition = delta != 0;
  
  indexes = condition & Cmax == fR;
  H(indexes) = 60 * (fG(indexes) - fB(indexes)) ./ delta(indexes);
  
  indexes = condition & Cmax == fG;
  H(indexes) = 60 * ((fB(indexes) - fR(indexes)) ./ delta(indexes) + 2);
  
  indexes = condition & Cmax == fB;
  H(indexes) = 60 * ((fR(indexes) - fG(indexes)) ./ delta(indexes) + 4);
  H = H / 360;
  H(H < 0) += 1;
  H(H > 1) -= 1;
  S(!condition) = 0;
  S(condition) = delta(condition) ./ Cmax(condition); 
  HSVmap = cat(3, H, S, V);
endfunction
