pop = 3;

points = rand(2,pop);
colors = zeros(pop, 1);

result = Naive(points, 0);

scatter(points(1,:), points(2,:), 25, points(4,:));