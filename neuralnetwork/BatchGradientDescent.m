function [ result ] = BatchGradientDescent(training, testing, network, learningRate)
%BATCHGRADIENTDESCENT Summary of this function goes here
%   Detailed explanation goes here

[d, N] = size(training);
[~, M] = size(testing);

% Set previous error to impossible value
prevError = -1;
iter = 1;
errorSimilarity = 0;
threshold = 10;

while errorSimilarity < threshold && iter < 1000
    disp ('Iteration: ' + string(iter));
    
    [Ein] = TrainingBGD(network, training);
    disp('Ein: ' + string(Ein));
    
    for i = 1 : 3
        network(i).updateWithGradient(learningRate);
    end
    
    % Calculate Error
    errors = 0;
    for i = 1:M
        xi = testing(2:d,i);
        output = sum(RunForwardProp(network, xi'), 1);
        target = testing(1,i);
        errors = errors + ((output - target)^2);
    end
    error = errors/(2*M);
    
    % Determine if algorithm should stop
    if abs(error - prevError) < 10
        errorSimilarity = errorSimilarity + 1;
    else
        errorSimilarity = 0;
    end
    
    iter = iter + 1;
    prevError = error;
end

disp('Gradient descent completed in: ' + iter);
result = w;

end

