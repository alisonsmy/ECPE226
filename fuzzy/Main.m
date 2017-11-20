% Alison Shu, Jeffrey Dwyer
% Dr. Mueller
% ECPE 226
% 9/25/2017
% HW3 - Logistic Regression

File = load('usps_modified.mat');
raw_data = File.data;
[img, N, digit] = size(raw_data);

oneValues = getFeatures(raw_data(:,:,1));
clusters = containers.Map;
classifications = containers.Map;

rng('default');
rng(376971);

% Collect classifications for 1 vs others
for i = 2:10
    others = getFeatures(raw_data(:,:,i));
    numbers = [oneValues; others];
    [N, ~] = size(numbers);

    options = [2 100 0.0001 1];
    [cs, U] = fcm(numbers, 2, options);
    
    % Save Info for first cluster
    cluster1 = num2str(2*i);
    a = Cluster;
    a.Center = cs(:, 1);
    clusters(cluster1) = a;
    
    % Save Info for first cluster
    cluster2 = num2str(2*i + 1);
    b = Cluster;
    b.Center = cs(:, 2);
    clusters(cluster2) = b;
    
    % Classify each point
    for j = 1:N
        m = Membership;
        m.Cluster1Name = cluster1;
        m.Cluster2Name = cluster2;
        m.Cluster1Membership = U(1,j);
        m.Cluster2Membership = U(2,j);
        x = numbers(j, 1);
        y = numbers(j, 2);
        key = CoordsToString(x,y);
        if isKey(classifications, key)
            c = classifications(key);
            classifications(key) = [m; c];
        else
            classifications(key) = [m];
        end
    end
end

% Create list of clusters
centers = [];
k = keys(clusters);
for i = 1:length(k)
    key = k(i);
    c = clusters(key{1}).Center;
    centers = [c centers];
end

% Cluster the centers to create categories
options = [2 100 0.001 1];
[T, ~] = fcm(centers,2, options);
for i = 1 : length(T)
    t = T(:,i);
    if t(1) > t(2)
        T(:,i) = 1;
    else
        T(:,i) = 2;
    end
end

% Assign Category to clusters
for i = length(k)
    key = k(i);
    c = clusters(key{1});
    c.NumberCat = T(i);
    clusters(key{1}) = c;
end

% Use the union to classify points
for k = keys(classifications)
    c = classifications(k{1});
    v = UnionClassify(clusters, c);
    classifications(k{1}) = v;
end

% Lookup classification for each point
numbers = getFeatures(raw_data);
[N, ~] = size(numbers);
colors = zeros(N, 1);
for i = 1 : N
    n = numbers(i, :);
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
scatter(numbers(:, 1),numbers(:,2),25,colors,'filled');

% % Normal FCM
% [~, U] = fcm(numbers,2);
% 
% maxU = max(U);
% index1 = find(U(1,:) == maxU);
% index2 = find(U(2,:) == maxU);
% 
% figure;
% hold on;
% axis([-1 1 -1 1]);
% ax = gca;
% ax.XAxisLocation = 'origin';
% ax.YAxisLocation = 'origin';
% plot(numbers(index1, 1),numbers(index1, 2),'ob')
% hold on
% plot(numbers(index2,1),numbers(index2, 2),'or')
% hold off






