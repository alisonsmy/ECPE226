function [ result ] = StochasticGradientDescent(training, learningRate)

[d, N] = size(training);

disp("Dimension is: " + d);
disp("Training  size: " + N);

run = true;

x = training(2:d, :);
y = training(1, :);

% d-1 because the first value is the result
w = zeros(d-1,1);
while run
    i = randi([1 N], 1); %get a random integer from 1 to N
    grad = GradientSignal(w, x(:,i), y(:,i)); 

    %update weight vector
    w = w - (learningRate)*grad; 

    % Determine if algorithm should stop
    run = norm(grad) < 0.01; % if gradient is small enough

end

result = w;

end

