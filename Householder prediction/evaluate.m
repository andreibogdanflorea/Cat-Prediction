function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
  cat_folder = strcat(path_to_testset, 'cats/');
  notcat_folder = strcat(path_to_testset, 'not_cats/');
  catPattern = fullfile(cat_folder, '*.jpg');
  notcatPattern = fullfile(notcat_folder, '*.jpg');
  catFiles = dir(catPattern);
  notcatFiles = dir(notcatPattern);
  correct = 0;
  total = 0;
  for k = 1: length(catFiles)
    baseFileName = catFiles(k).name;
    fullFileName = fullfile(cat_folder, baseFileName);
    total = total + 1;
    if strcmp(histogram, 'RGB') == 1
      x = rgbHistogram(fullFileName, count_bins);
    else
      x = hsvHistogram(fullFileName, count_bins);
    endif
    x(3 * count_bins + 1) = 1;
    y = w' * x';
    if y >= 0
      correct = correct + 1;
    endif
  endfor
  
  for k = 1: length(notcatFiles)
    baseFileName = notcatFiles(k).name;
    fullFileName = fullfile(notcat_folder, baseFileName);
    total = total + 1;
    if strcmp(histogram, 'RGB') == 1
      x = rgbHistogram(fullFileName, count_bins);
    else
      x = hsvHistogram(fullFileName, count_bins);
    endif
    x(3 * count_bins + 1) = 1;
    y = w' * x';
    if y < 0
      correct = correct + 1;
    endif
  endfor
  percentage = double(correct) / total;
endfunction