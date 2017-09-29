% Alison Shu, Jeffrey Dwyer
% Dr. Mueller
% ECPE 226
% 9/25/2017
% HW3 - Logistic Regression

lr = 0.1; % learning rates of 0.1, 1, 10, 50.

File = load('usps_modified.mat');
raw_data = File.data;
[img, N, digit] = size(raw_data);

% ones = CleanData(raw_data(:,:,1), 1);
% others = CleanData(raw_data(:,:,2:10), -1);
% 
% idx = randperm(N*digit);
% 
% cleanedData = cat(2,ones, others);
% cleanedData = cleanedData(:,idx);
% 
% testing = cleanedData(:,1:400);
% training = cleanedData(:,400:(N*digit));

training = raw_data(:,:,1);

% Get Intensity and symmetry from training set
%get x1 from raw data. x1 is intensity
x1 = GetIntensity(training); % intensity of digit #, which is x1

% get x2 from raw data. x2 is symmetry
x2 = GetSymmetry(training);  % symmetry of digit #, which is x2

VecX3 = [];
VecX4 = [];
for i = 2:10
    verification = raw_data(:,:,i);
    x3 = GetIntensity(verification);
    x4 = GetSymmetry(verification);
    VecX3 = [VecX3; x3];
    VecX4 = [VecX4; x4];
end

% put constant (1) x's first column
Const = ones(N, 1);
xTrain = [Const, x1, x2];
Const1 = ones(N*9, 1);
xVerif = [Const1, VecX3, VecX4];

result = BatchGradientDescent(xTrain, xVerif, 0.1);
disp("Logistic Regression with Batch Gradient Descent: ");
disp(result);

disp("Logistic Regression with Stochastic Gradient Descent: ");
result = StochasticGradientDescent(xTrain, 0.1);
disp(result);

disp(ones(:, 50));

figure

scatter(ones(2,:), ones(3,:),5,'g','filled');
hold('on');

scatter(others(2,:), others(3,:),5,'r','filled');
hold('on');

x = linspace(0,0.1, 10);
y = (-1/result(2)/(1/result(1)))*x;
plot(x,y)



