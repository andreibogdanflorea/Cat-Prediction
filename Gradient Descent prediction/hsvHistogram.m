function [sol] = hsvHistogram(path_to_image, count_bins)
  image = imread(path_to_image);
  hsvimage = RGBToHSV(image);
  
  int = 0: 1.01 / count_bins: 1.01;
  H = hsvimage(:, :, 1)(:);
  hues = histc(H, int);
  S = hsvimage(:, :, 2)(:);
  saturations = histc(S, int);
  V = hsvimage(:, :, 3)(:);
  values = histc(V, int);
  sol = [hues(1:count_bins)' saturations(1:count_bins)' values(1:count_bins)'];
end