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

theta = @(x) x;
thetaPrime = @(x) x;
weightUpdate = @(x) x;

layer1 = Layer;
layer1.initRandom(2,theta, thetaPrime, weightUpdate);

layer2 = Layer;
layer2.initRandom(5,theta, thetaPrime, weightUpdate);

layer3 = Layer;
layer3.initRandom(1,theta, thetaPrime, weightUpdate);

network = [layer1 layer2 layer3];

input = [1; 1; 1];
for i = 1:3
    input = network(i).forward(input);
end

disp('Result of forward prop: ');
disp(input);

deltas = [];
for i = 3:-1:1
    deltas = network(i).back(deltas);
end

% figure;
% hold on;
% axis([-1 1 -1 1]);
% ax = gca;
% ax.XAxisLocation = 'origin';
% ax.YAxisLocation = 'origin';
% scatter(ones(3,:), ones(4,:),5,'g','filled');
% scatter(others(3,:), others(4,:),5,'r','filled');
% hold off;

% Run 10 times each for each rate
% for r = 1:10
%     result = BatchGradientDescent(training, testing, lr);
% %     result = StochasticGradientDescent(training, lr);
% 
%     m = -1:0.01:1;
%     k = -(result(2)*m + result(1))/result(3);
%     hold on;
%     if r == 10
%         plot(m,k, 'color',[.9 0.5 0.0]);
%         [in, out] = MeasureError(training, testing, result);
%         disp("Ein: " + in);
%         disp("Eout: " + out);
%     else
%         plot(m,k, 'color',[.9 .9 .9]);
%     end
%     hold off;
% end
% 
% T = ['Graph of result with learning rate: ', num2str(lr)];
% title(T);




