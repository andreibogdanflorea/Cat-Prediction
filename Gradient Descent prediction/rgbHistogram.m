function [sol] = rgbHistogram(path_to_image, count_bins)
  image = imread(path_to_image);
  [N M P] = size(image);
  reds = zeros(1, count_bins); greens = reds; blues = reds;
  intervals = (0: count_bins) * 256 / count_bins;
  reds = histc((image(:, :, 1))(:), intervals);
  greens = histc((image(:, :, 2))(:), intervals);
  blues = histc((image(:, :, 3))(:), intervals);
  sol = [reds(1: count_bins)' greens(1: count_bins)' blues(1: count_bins)'];  
end