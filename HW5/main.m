pop = 40;

points = rand(pop, 2);

result1 = Naive(points, 0);
result2 = Kung(points, 0);

figure;
scatter(result1(:,1), result1(:, 2), 25, result1(:,4), 'filled');

figure;
scatter(result2(:,1), result2(:, 2), 25, result2(:,4), 'filled');