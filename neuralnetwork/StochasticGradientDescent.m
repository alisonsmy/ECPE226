function [ result ] = StochasticGradientDescent(training, testing, network, learningRate)

[d, N] = size(training);
[~, M] = size(testing);
[~, L] = size(network);

disp('Dimension is: ' + d);
disp('Training  size: ' + N);

x = training(3:d, :);
y = training(1, :);

% d-1 because the first value is the result
prevError = -1;
iter = 1;
errorSimilarity = 0;
threshold = 20;

error = ones(1000, 1);

while errorSimilarity < threshold && iter < 200 && error(iter) >= 0.02
    fprintf ('Iteration: ' + string(iter) + '\n');
    
    i = randi([1 N], 1); %get a random integer from 1 to N
    [Ein] = TrainingSGD(network, x(:,i), y(i));
    
    for i = 1 : L
        network(i).updateWithGradient(learningRate);
    end
    
    % Calculate Error
    errors = 0;
    for i = 1:M
        xi = testing(3:d,i);
        output = Theta(sum(RunForwardProp(network, xi), 1));
        target = testing(1,i);
        errors = errors + ((output - target)^2);
    end
    error(iter) = errors/(2*M);
    fprintf('Error: ' + string(error(iter)) + '\n');
    
    % Determine if algorithm should stop
    if abs(error(iter) - prevError) < 0.00001
        errorSimilarity = errorSimilarity + 1;
    else
        errorSimilarity = 0;
    end
    
    iter = iter + 1;
    prevError = error(iter);
end
disp('Gradient descent completed in: ' + iter);
result = error;

end

