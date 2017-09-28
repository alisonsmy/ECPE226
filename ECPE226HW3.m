% Alison Shu, Jeffrey Dwyer
% Dr. Mueller
% ECPE 226
% 9/25/2017
% HW3 - Logistic Regression

lr = 0.1; % learning rates of 0.1, 1, 10, 50.

File = load('usps_modified.mat');
raw_data = File.data;
[img, N, digit] = size(raw_data);

ones = CleanData(raw_data(:,:,1), 1);
others = CleanData(raw_data(:,:,2:10), -1);

idx = randperm(N*digit);

disp(size(ones));
disp(size(others));

cleanedData = cat(2,ones, others);
cleanedData = cleanedData(:,idx);

result = BatchGradientDescent(cleanedData, 0.1);
disp(result);





