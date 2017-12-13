pop = 40;

points = rand(pop, 2);

result = Naive(points, 0);
result1 = Kung(points, 0);

%scatter(result(:,1), result(:, 2), 25, result(:,4), 'filled');
scatter(result1(:,1), result1(:, 2), 25, result1(:,4), 'filled');