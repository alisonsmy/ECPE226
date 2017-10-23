function [g, Ein] = TrainingSGD(network,y)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [L, ~] = size(network);
    [n, d] = size(network(1).outputsTheta);
    Ein = 0;
    G = zeros(n, d+1);
    g = zeros(L, n);
    %do FWD Prop

    %do Back Prop
    Ein = Ein + (1/(2*n))*((network(end).outputsTheta-y(i))^2);
    for l = 1:L
        G(i,:) = network(l-1).outputsTheta*network(i).back()';
        g(l, :) = G;
    end

    
end



