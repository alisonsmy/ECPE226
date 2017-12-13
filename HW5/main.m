clc;

pop = 5;

points = rand(pop, 2);

result = Naive(points, 0);
%disp("result 1: ");
%disp(result);
[result1, f] = Kung(points, 0);
%disp("result 2: ");
%disp(result1);

scatter(result(:,1), result(:, 2), 25, result(:,4), 'filled');
figure;
scatter(result1(:,1), result1(:, 2), 25, result1(:,3), 'filled');