function [g, Ein] = TrainingBGD(network,y)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [L, ~] = size(network);
    [n, d] = size(network(1).outputThetas);
    Ein = 0;
    G = zeros(n, d+1);
    g = zeros(L, d+1);
    for i = 1:n
        %do FWD Prop
        for l = 1:L
            input = network(l).forward(network(1).outputThetas(i,:));
        end
        %do Back Prop
        x = network(3).outputs(:,1);
        deltas = (x - y(i)) * network(3).thetaPrime(network(3).outputs);
        for l = L:-1:1
            deltas = network(l).back(deltas);
        end
        %Calculate Error
        Ein = Ein + (1/(2*n))*((input-y(i))^2);
        %Calculate gradient
        for l = 1:L
            G(i,:) = network(l-1).outputThetas*deltas';
            G = G + (1/n)*G(i, :);
            %g(l, :) = G;
        end
    end

    deltas = G;
    for i = 3:-1:1
        deltas = network(i).back(deltas, 0.1);
    end
    
end

