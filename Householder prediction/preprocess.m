function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
  cat_folder = strcat(path_to_dataset, 'cats/');
  notcat_folder = strcat(path_to_dataset, 'not_cats/');
  catPattern = fullfile(cat_folder, '*.jpg');
  notcatPattern = fullfile(notcat_folder, '*.jpg');
  catFiles = dir(catPattern);
  notcatFiles = dir(notcatPattern);
  X = zeros(length(catFiles) + length(notcatFiles), 3 * count_bins);
  y = zeros(length(catFiles) + length(notcatFiles), 1);
  count = 0;
  for k = 1: length(catFiles)
    baseFileName = catFiles(k).name;
    fullFileName = fullfile(cat_folder, baseFileName);
    count = count + 1;
    if strcmp(histogram, 'RGB') == 1
      X(count, :) = rgbHistogram(fullFileName, count_bins);
    else
      X(count, :) = hsvHistogram(fullFileName, count_bins);
    endif
    y(count) = 1;
  endfor
  
  for k = 1: length(notcatFiles)
    baseFileName = notcatFiles(k).name;
    fullFileName = fullfile(notcat_folder, baseFileName);
    count = count + 1;
    if strcmp(histogram, 'RGB') == 1
      X(count, :) = rgbHistogram(fullFileName, count_bins);
    else
      X(count, :) = hsvHistogram(fullFileName, count_bins);
    endif
    y(count) = -1;
  endfor  
endfunction
