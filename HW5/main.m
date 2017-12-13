pop = 40;

points = rand(pop, 2);

<<<<<<< HEAD
result1 = Naive(points, 0);
result2 = Kung(points, 0);

figure;
scatter(result1(:,1), result1(:, 2), 25, result1(:,4), 'filled');

figure;
scatter(result2(:,1), result2(:, 2), 25, result2(:,4), 'filled');
=======
result = Naive(points, 0);
result1 = Kung(points, 0);

%scatter(result(:,1), result(:, 2), 25, result(:,4), 'filled');
scatter(result1(:,1), result1(:, 2), 25, result1(:,4), 'filled');
>>>>>>> 6bc49a5f9ea50d7fcb7c2442e9dfccac869f62a2
