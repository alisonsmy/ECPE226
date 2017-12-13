% pop = 40;
% 
% points = rand(pop, 2);
% 
% result1 = Naive(points, 0);
% result2 = Kung(points, 0);
% 
% figure;
% scatter(result1(:,1), result1(:, 2), 25, result1(:,4), 'filled');
% 
% figure;
% scatter(result2(:,1), result2(:, 2), 25, result2(:,4), 'filled');

n = zeros(1,5);
k = zeros(1,5);
for m = 1:5
    points = rand(m*40, 2);
    
    tic; % Test Naive
    result = Naive(points, 0);
    n(m) = toc;
    
    tic; % Test Kung
    result = Naive(points, 0);
    k(m) = toc;
end

figure;
hold on;
plot(1:5, n, 'r--o', 1:5, k, 'b--*');
