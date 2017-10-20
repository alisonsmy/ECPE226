function [ result ] = ForwardPropagation(w, x, y)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    X = x(0,:);
    L = length(X);
    [n, d] = size(x);
    s = zeros(n, d);
    for l = 1:L
        s(l, :) = w(1, :)*X(l-1, :);
        theta = transformation(s(l, :));
        x(l, :) = [1, theta];
    end
    result = X(L);
end

function [ t ] = transformation(s)
    t = 1/(1+e^(-s));
end