function [ result ] = BatchGradientDescent(training, learningRate)
%BATCHGRADIENTDESCENT Summary of this function goes here
%   Detailed explanation goes here

[d, N] = size(training);

disp("Dimension is: " + d);
disp("Training  size: " + N);

% d-1 because the first value is the result
grad = zeros(N, d-1);
run = true;

x = training(2:d, :);
y = training(1, :);

% d-1 because the first value is the result
w = zeros(d-1,1);

while run
    for i = 1:N
        % s = sign(wTx)
        s = sign(dot(w, x(:,i)));
        
        % input from logistic function, -Yn*s
        ys = -(y(:,i)*s); 
        
        % logistic function, 1/e^(-s)
        logis = 1/(1+exp(-ys)); 
        
        %calculate gradient for each element, Yn*Xn*logistic(-Yn*s)
        grad(i,:) = y(:,i)*x(:,i)*logis; 
    end
    
    %calculate average direction vector, -1/N*sum of gradients
    v = -(sum(grad)/N)'; 
    
    %update weight vector
    w = w + (learningRate)*v; 
    
    %update stopping criteria
    % if gradient is small enough, stop
    run = norm(v) < 0.1;
end

result = w;

end

