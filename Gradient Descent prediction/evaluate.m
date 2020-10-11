function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
  cat_folder = strcat(path_to_testset, 'cats/');
  notcat_folder = strcat(path_to_testset, 'not_cats/');
  catPattern = fullfile(cat_folder, '*.jpg');
  notcatPattern = fullfile(notcat_folder, '*.jpg');
  catFiles = dir(catPattern);
  notcatFiles = dir(notcatPattern);
  correct = 0;
  total = 0;
  X = zeros(length(catFiles) + length(notcatFiles), 3 * count_bins + 1);
  y = zeros(length(catFiles) + length(notcatFiles));
  for k = 1: length(catFiles)
    baseFileName = catFiles(k).name;
    fullFileName = fullfile(cat_folder, baseFileName);
    total = total + 1;
    if strcmp(histogram, 'RGB') == 1
      X(total, 1: 3 * count_bins) = rgbHistogram(fullFileName, count_bins);
    else
      X(total, 1: 3 * count_bins) = hsvHistogram(fullFileName, count_bins);
    endif
    X(total, 3 * count_bins + 1) = 1;
    y(total) = 1;
  endfor
  
  for k = 1: length(notcatFiles)
    baseFileName = notcatFiles(k).name;
    fullFileName = fullfile(notcat_folder, baseFileName);
    total = total + 1;
    if strcmp(histogram, 'RGB') == 1
      X(total, 1: 3 * count_bins) = rgbHistogram(fullFileName, count_bins);
    else
      X(total, 1: 3 * count_bins) = hsvHistogram(fullFileName, count_bins);
    endif
    X(total, 3 * count_bins + 1) = 1;
    y(total) = -1;
  endfor
  for j = 1: 3 * count_bins
    col = X(1: total, j);
    X(1: total, j) = (col - mean(col)) / std(col);
  endfor
  
  y_calc = X * w;
  indexes = (y_calc((y_calc >= 0 & y == 1) | (y_calc < 0 & y == -1)));
  percentage = double(length(indexes)) / total;
endfunction