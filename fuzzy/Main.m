% Alison Shu, Jeffrey Dwyer
% Dr. Mueller
% ECPE 226
% 11/18/2017
% HW5 - Fuzzy Logic

File = load('usps_modified.mat');
% File = load('usps_test.mat');
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

% open fcmdemo -> 558-591 shows how to display membership func graphically
% open fcm -> following sample code for using fcm
% data = rand(100,2);
[center,U,obj_fcn] = fcm(training,2);
plot(ones(3,:), ones(4,:),'o');
plot(others(3,:), others(4,:),'x');
hold on;
maxU = max(U);
% Find the data points with highest grade of membership in cluster 1
index1 = find(U(1,:) == maxU);
% Find the data points with highest grade of membership in cluster 2
index2 = find(U(2,:) == maxU);
line(ones(index1,3),ones(index1,4),'marker','*','color','g');
line(others(index2,3),others(index2,4),'marker','*','color','r');
% Plot the cluster centers
plot((center([1 2],1)),(center([1 2],2)),'*','color','k')
hold off;

% lr = 0.1; % learning rates of 0.1, 1, 10, 50.
% 
% figure;
% hold on;
% axis([-1 1 -1 1]);
% ax = gca;
% ax.XAxisLocation = 'origin';
% ax.YAxisLocation = 'origin';
% scatter(ones(3,:), ones(4,:),5,'g','filled');
% scatter(others(3,:), others(4,:),5,'r','filled');
% hold off;
% 
% % Run 10 times each for each rate
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




