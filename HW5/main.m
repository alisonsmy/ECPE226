pop = 40;

points = rand(pop, 2);

result = Naive(points, 0);

scatter(result(:,1), result(:, 2), 25, result(:,4), 'filled');