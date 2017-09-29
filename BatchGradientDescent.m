function [ result ] = BatchGradientDescent(training, testing, learningRate)
%BATCHGRADIENTDESCENT Summary of this function goes here
%   Detailed explanation goes here

[d, N] = size(training);
[~, M] = size(testing);

disp("Dimension is: " + d);
disp("Training  size: " + N);

% d-1 because the first value is the result
grad = zeros(N, d-1);

x = training(2:d, :);
y = training(1, :);

% d-1 because the first value is the result
w = rand(d-1,1);

% Set previous error to impossible value
prevError = -1;

iter = 1;
errorSimilarity = 0;
threshold = 10;

while errorSimilarity < threshold
    disp("Iteration: " + iter);
    for i = 1:N
        grad(i,:) = GradientSignal(w, x(:,i), y(:,i)); 
    end
    
    %calculate average direction vector, -1/N*sum of gradients
    v = -(sum(grad)/N)'; 
    
    %update weight vector
    w = w + (learningRate)*v; 
    
    % Calculate Error
    errors = zeros(M,1);
    for i = 1:M
        s = sign(dot(w, x(:,i)));
        errors(i) = (y(:,i) - s)^2;
    end
    error = mean(errors);
    
    % Determine if algorithm should stop
    if error == prevError
        errorSimilarity = errorSimilarity + 1;
    end
    
    iter = iter + 1;
    prevError = error;
end

result = w;

end

