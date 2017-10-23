function [g, Ein] = TrainingBGD(network,y)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [L, ~] = size(network);
    [n, d] = size(network(1).outputsTheta);
    Ein = 0;
    G = zeros(n, d+1);
    g = zeros(L, d+1);
    for i = 1:n
        %do FWD Prop
        for l = 1:L
            input = network(l).forward(network(1).outputsTheta(i,:));
        end
        %do Back Prop
        x = network(3).outputs(:,1);
        deltas = (x - y(i)) * thetaPrime(network(3).outputThetas);
        for l = L:-1:1
            deltas = network(l).back(deltas);
        end
        %Calculate Error
        Ein = Ein + (1/(2*n))*((input-y(i))^2);
        %Calculate gradient
        for l = 1:L
            G(i,:) = network(l-1).outputsTheta*deltas';
            G = G + (1/n)*G(i, :);
            %g(l, :) = G;
        end
    end
    %v = (sum(g)/n)';                %get total gradient vector
    for l = 1:L
       network(l).weights = network(l).weightUpdate(network(l).weights, G);
    end
    
end
