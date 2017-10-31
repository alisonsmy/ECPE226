function [ result ] = StochasticGradientDescent(training, testing, network, learningRate)

% ALGO CONFIG
THRESHOLD = 20;
MAX_ITER = 200;
MIN_ERROR = 0.2;

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
error = zeros(1000, 1);
Eins = zeros(1000,1);
run = true;

while run
    fprintf ('Iteration: ' + string(iter) + '\n');
    
    i = randi([1 N], 1); %get a random integer from 1 to N
    [Ein] = TrainingSGD(network, x(:,i), y(i));
    Eins(iter) = Ein;
    fprintf('Ein: ' + string(Eins(iter)) + '\n');
    learningRate = LinearSearchBisection(network, x(:,i), y(i));
    UpdateNetwork(network, learningRate);
    
    % Calculate Error
    errors = 0;
    for i = 1:M
        xi = testing(3:d,i);
        if isnan(xi(2))
            fprintf('here nan!');
        end
        errors = errors + Error(network, xi,testing(1,i));
    end
    error(iter) = errors/M;
    fprintf('Eout: ' + string(error(iter)) + '\n');
    
    % Determine if algorithm should stop
    if abs(error(iter) - prevError) < 0.00001
        errorSimilarity = errorSimilarity + 1;
    else
        errorSimilarity = 0;
    end
    
    iter = iter + 1;
    prevError = error(iter);
    
    thresh = errorSimilarity < THRESHOLD;
    maxIter = iter < MAX_ITER;
    minError = Eins(iter - 1) >= MIN_ERROR;
    
    run = thresh && maxIter && minError;
end
disp('Gradient descent completed in: ' + iter);
result = Eins;

end

