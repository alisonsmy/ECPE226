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

cleanedData = cat(2,ones, others);
cleanedData = cleanedData(:,idx);

testing = cleanedData(:,1:400);
training = cleanedData(:,400:(N*digit));

result = BatchGradientDescent(training, testing, 0.1);
disp("Logistic Regression with Batch Gradient Descent: ");
disp(result);

disp("Logistic Regression with Stochastic Gradient Descent: ");
result = StochasticGradientDescent(training, 0.1);
disp(result);




