% Alison Shu, Jeffrey Dwyer
% Dr. Mueller
% ECPE 226
% 9/25/2017
% HW3 - Logistic Regression

File = load('usps_modified.mat');
raw_data = File.data;
[img, N, digit] = size(raw_data);

oneValues = CleanData(raw_data(:,:,1), 1);
centers = zeros(2,20);
for i = 2:10
    others = CleanData(raw_data(:,:,i), 0);
    numbers = -1*[ oneValues(3:4,:) others(3:4,:)];
    [~, N] = size(numbers);

%     c = clusterdata(numbers','linkage','ward','savememory','on','maxclust', 2);
%     x = numbers(1,:);
%     y = numbers(2,:);
%     figure;
%     scatter(x,y,10,c);
    
    options = [10 15 0.01 1];
    [U, cs] = fcm(numbers, 2, options);
    centers(:, 2*(i-1)) = cs(1,:);
    centers(:, 2*(i-1) + 1) = cs(2,:);
    
    maxU = max(U);
    index1 = find(U(1,:) == maxU);
    index2 = find(U(2,:) == maxU);
    
%     figure;
%     hold on;
%     axis([-1 1 -1 1]);
%     ax = gca;
%     ax.XAxisLocation = 'origin';
%     ax.YAxisLocation = 'origin';
%     plot(numbers(2,index1),numbers(1,index1),'ob')
%     hold on
%     plot(numbers(2,index2),numbers(1,index2),'or')
%     hold off
end

figure;
hold on;
axis([-1 1 -1 1]);
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
plot(centers(1,:),centers(2,:),'ob')





