% Alison Shu, Jeffrey Dwyer
% Dr. Mueller
% ECPE 226
% 9/25/2017
% HW3 - Logistic Regression

File = load('usps_modified.mat');
raw_data = File.data;
[img, N, digit] = size(raw_data);

oneValues = CleanData(raw_data(:,:,1), 1);
others = CleanData(raw_data(:,:,2:10), 0);

rng(31159265);
idx = randperm(N*digit);

cleanedData = cat(2,oneValues, others);
cleanedData = cleanedData(:,idx);

testing = cleanedData(:,1:400);
training = cleanedData(:,401:(N*digit));

lr = 0.1; % learning rates of 0.1, 1, 10, 50.

theta = @(x) Theta(x);
thetaPrime = @(x) ThetaPrime(x);
id = @(s)s;

layer1 = Layer;
layer1.initRandom(2, 5, theta, thetaPrime);

layer2 = Layer;
layer2.initRandom(6, 1, theta, thetaPrime);

network = [layer1 layer2];

%Run 10 times each for each rate

% result = BatchGradientDescent(training, testing, network, lr);
result = StochasticGradientDescent(training, testing, network, lr);
% result = VariableLearningRate(training, testing, network, lr);
m = 1:100;
k = result(m);

hold on;
plot(m,k, 'color','r');
hold off;

T = ['Graph of result with learning rate: ', num2str(lr)];
title(T);
figure();

scale = 0.1;
x=-1:scale:1;
y=-1:scale:1;
[X,Y]= meshgrid(x,y);
Z = zeros(size(X));
for i = 1:21
    for j = 1:21
        Z(i,j) = RunForwardProp(network, [X(i,j); Y(i,j)]);
    end
end
surf(X,Y,Z);
colorbar;
view(2);
figure();

hold on;
axis([-1 1 -1 1]);
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
scatter(oneValues(3,:), oneValues(4,:),5,'g','filled');
scatter(others(3,:), others(4,:),5,'r','filled');
hold off;


