% Alison Shu, Jeffrey Dwyer
% Dr. Mueller
% ECPE 226
% 9/25/2017
% HW3 - Logistic Regression

File = load('usps_modified.mat');
raw_data = File.data;
[img, N, digit] = size(raw_data);

ones = CleanData(raw_data(:,:,1), 1);
others = CleanData(raw_data(:,:,2:10), -1);

rng(314159265);
idx = randperm(N*digit);

cleanedData = cat(2,ones, others);
cleanedData = cleanedData(:,idx);

testing = cleanedData(:,1:400);
training = cleanedData(:,401:(N*digit));

lr = 0.1; % learning rates of 0.1, 1, 10, 50.

theta = @(s) (1/(1 + exp(-s)));
thetaPrime = @(x) x.*(1-x);
id = @(s)s;

layer1 = Layer;
layer1.initRandom(2, 5, theta, thetaPrime);

layer2 = Layer;
layer2.initRandom(6, 1, theta, thetaPrime);

network = [layer1 layer2];

%Run 10 times each for each rate

% result = BatchGradientDescent(training, testing, network, lr);
result = StochasticGradientDescent(training, testing, network, lr);

m = 1:100;
k = result(m);

hold on;
plot(m,k, 'color','r');
hold off;

T = ['Graph of result with learning rate: ', num2str(lr)];
title(T);




