% Alison Shu, Jeffrey Dwyer
% Dr. Mueller
% ECPE 226
% 9/25/2017
% HW3 - Logistic Regression


File = load('usps_modified.mat');
raw_data = File.data;
[img, example, digit] = size(raw_data);
lr = 0.1; % learning rates of 0.1, 1, 10, 50.

% Logistic Regression with Batch Gradient Descent
grad = zeros(example, 1);
run = true;
while run
    for i = 1:N
        s = sign(dot(w,x(i,:))); % s = sign(wTx)
        ys = -(y(i)*s); % input from logistic function, -Yn*s
        logis = 1/(1+exp(-ys)); % logistic function, 1/e^(-s)
        grad(i,:) = y(i)*x(i)*logis; %calculate gradient for each element, Yn*Xn*logistic(-Yn*s)
    end
    v = -(sum(grad)/N)'; %calculate average direction vector, -1/N*sum of gradients
    w = w + (lr)*v; %update weight vector
    %update stopping criteria
    % if gradient is small enough, stop
end



% Logistic Regression with Stochastic Gradient Descent (single data point)
while % ~(stopping criteria)
    i = rand([1 N], 1); %get a random integer from 1 to N
    s = sign(dot(w,x(i,:))); % s = sign(wTx)
    ys = -(y(i)*s); % input from logistic function, -Yn*s
    logis = 1/(1+exp(-ys)); % logistic function, 1/e^(-s)
    grad = y(i)*x(i)*logis; %calculate gradient for each element, Yn*Xn*logistic(-Yn*s)
    w = w - lr*grad; %update weight vector
    %update stopping criteria
end





