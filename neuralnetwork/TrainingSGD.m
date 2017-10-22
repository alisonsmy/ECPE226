function [outputArg1,outputArg2] = TrainingSGD(x,y,lr,tol)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    [n,d] = size(x); 		%get size of input data
    w = rand(d+1,1);        %start with random weight vector
    x = [ones(n,1),x];      %add x(1) to input data, x(1) = 1 always
    g = ones(d+1,1);

    while (abs(mean(g)) > tol)  
        i = randi([1 n],1);
        s = dot(w,x(i,:)');         %calculate signal
        theta = 1/(1+exp(y(i)*s));  %calculate theta(-ys)
        g = -y(i)*x(i,:)'*theta;    %calculate i-th gradient vector
        w = w - lr*g;               %update weight vector
    end
end

