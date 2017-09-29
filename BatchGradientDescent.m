function [ result ] = BatchGradientDescent(training, testing, learningRate)
%BATCHGRADIENTDESCENT Summary of this function goes here
%   Detailed explanation goes here

[d, N] = size(training);
[~, M] = size(testing);

disp("Dimension is: " + d);
disp("Training  size: " + N);

% d-1 because the first value is the result
grad = zeros(N, d-1);
run = true;

x = training(2:d, :);
y = training(1, :);

% d-1 because the first value is the result
w = zeros(d-1,1);
prevError = 100;
while run
    for i = 1:N
        grad(i,:) = GradientSignal(w, x(:,i), y(:,i)); 
    end
    
    %calculate average direction vector, -1/N*sum of gradients
    v = -(sum(grad)/N)'; 
    
    %update weight vector
    w = w + (learningRate)*v; 
    
    % Calculate Error
    errors = zeros(M);
    for i = 1:M
        s = sign(dot(w, x(:,i)));
        errors(i) = (y(:,i) - s)^2;
    end
    error = sum(errors)/M;
    disp(error);
    
    % Determine if algorithm should stop
    run = abs(error - prevError) < 1;
end

result = w;

end

