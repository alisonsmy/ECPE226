function [g, Ein] = TrainingBGD(network,training, learningRate)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [L, ~] = size(network);
    [n, d] = size(network(1).outputThetas);
    
    [dim, N] = size(training);
    x = training(2:dim, :);
    y = training(1, :);
    
    Ein = 0;
    G = zeros(n, d+1);
    g = zeros(L, d+1);
    for i = 1:N
        
        %do FWD Prop
        input = x(i);
        for l = 1:L
            input = network(l).forward(input);
        end

        %Calculate Error
        Ein = Ein + (1/(2*n))*((input-y(i))^2);
        %Calculate gradient
        deltas = (x(i) - y(i)) * network(L).thetaPrime(network(3).outputs);
        for l = 1:L
            deltas = network(l).backNoUpdate(deltas, learningRate);
            G(i,:) = network(l-1).outputThetas*deltas';
            G = G + (1/N)*G(i, :);
        end
    end

    deltas = G;
    for i = 3:-1:1
        deltas = network(i).back(deltas, learningRate);
    end
    
end

