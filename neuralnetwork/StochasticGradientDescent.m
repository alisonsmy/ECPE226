function [ result ] = StochasticGradientDescent(training, network, learningRate)

[d, N] = size(training);

disp('Dimension is: ' + d);
disp('Training  size: ' + N);

run = true;

x = training(2:d, :);
y = training(1, :);

% d-1 because the first value is the result
w = zeros(d-1,1);
iter = 1;
preGrad = 0;
while run
    i = randi([1 N], 1); %get a random integer from 1 to N
    if iter > 1
        preGrad = grad;
    end
    
    [Ein] = TrainingSGD(network, x(i), y(i));
    disp ('Ein: ' + string(Ein));
    
    for i = 1 : 3
        network(i).updateWithGradient(learningRate);
    end
    
    iter = iter +1;

%     % Determine if algorithm should stop
%     % if gradient is small enough, stop
%     run = norm(grad) < 0.001; 
    
    % Gradient hasn't changed significantly in the last n - # of iter, stop
    if round(grad, 5) == round(preGrad, 5)
        run = false;
    end 

end
disp('Gradient descent completed in: ' + iter);
result = w;

end

