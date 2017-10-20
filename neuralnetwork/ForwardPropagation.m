function [ result ] = ForwardPropagation(w, x, y)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    X = x(0,:);
    [n, d] = size(X);
    s = zeros(n, d);
    for l = 1:n
        s(l, :) = dot(w(1, :), X(l-1, :), 2);
        theta = transformation(s);
        X(l, :) = [1, theta];
    end
    result = X(L);
end

function [ theta ] = transformation(s)
    [n, d] = size(s);
    theta = zeros(n, d);
    for i = 1:n
        theta(i) = 1/(1+exp(y(i)*s(i)));    %calculate theta(-s)
    end
end