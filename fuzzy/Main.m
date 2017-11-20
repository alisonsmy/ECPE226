% Alison Shu, Jeffrey Dwyer
% Dr. Mueller
% ECPE 226
% 9/25/2017
% HW3 - Logistic Regression

File = load('usps_modified.mat');
raw_data = File.data;
[img, N, digit] = size(raw_data);

oneValues = CleanData(raw_data(:,:,1), 1);
clusters = containers.Map;
classifications = containers.Map;

for i = 2:10
    others = CleanData(raw_data(:,:,i), 0);
    numbers = -1*[ oneValues(3:4,:) others(3:4,:)];
    [~, N] = size(numbers);

    options = [5 100 0.001 1];
    [U, cs] = fcm(numbers, 2, options);
    
    cluster1 = num2str(2*i);
    a = Cluster;
    a.Center = cs(:, 1);
    clusters(cluster1) = a;
    
    cluster2 = num2str(2*i + 1);
    b = Cluster;
    b.Center = cs(:, 2);
    clusters(cluster2) = b;
    
    for j = 1:N
        m = Membership;
        m.Cluster1Name = cluster1;
        m.Cluster2Name = cluster2;
        m.Cluster1Membership = U(1,j);
        m.Cluster2Membership = U(2,j);
        x = numbers(1, j);
        y = numbers(2, j);
        key = CoordsToString(x,y);
        if isKey(classifications, key)
            c = classifications(key);
            classifications(key) = [m; c];
        else
            classifications(key) = [m];
        end
    end
end

centers = [];
k = keys(clusters);
for i = 1:length(k)
    key = k(i);
    c = clusters(key{1}).Center;
    centers = [c centers];
end

T = clusterdata(centers','Maxclust',2);

for i = length(k)
    key = k(i);
    c = clusters(key{1});
    c.NumberCat = T(i);
    clusters(key{1}) = c;
end

for k = keys(classifications)
    c = classifications(k{1});
    v = UnionClassify(clusters, c);
    classifications(k{1}) = v;
end

[~, N] = size(numbers);
colors = zeros(N, 1);
for i = 1 : N
    n = numbers(:, i);
    x = n(1);
    y = n(2);
    c = classifications(CoordsToString(x,y));
    colors(i) = c;
end

figure;
hold on;
axis([-1 1 -1 1]);
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
scatter(numbers(1,:),numbers(2,:),25,colors','filled');

% Normal FCM

[U, centers] = fcm(numbers,2);

maxU = max(U);
index1 = find(U(1,:) == maxU);
index2 = find(U(2,:) == maxU);

figure;
hold on;
axis([-1 1 -1 1]);
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
plot(numbers(2,index1),numbers(1,index1),'ob')
hold on
plot(numbers(2,index2),numbers(1,index2),'or')
hold off






