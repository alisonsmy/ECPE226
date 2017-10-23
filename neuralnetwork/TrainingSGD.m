function [finalG, Ein] = TrainingSGD(network,training)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [~, L] = size(network);
    [~, d] = size(network(L).weights);
    
    [dim, N] = size(training);
    x = training(2:dim, :);
    y = training(1, :);
    
    Ein = 0;
    G = zeros(d);

    xi = x(2:3, i);
    yi = y(i);

    %do FWD Prop
    output = sum(RunForwardProp(network, xi), 1);

    %Calculate Error
    Ein = Ein + (1/(2*N))*((output-yi).^2);

    %Calculate gradient
    diff = (output - yi);
    sig = network(L).thetaPrime(network(L).outputs);
    deltas = diff' * sig;
    for l = L:-1:2
        deltas = network(l).backNoUpdate(deltas);
        xn = network(l-1).outputThetas;
        G = sum(xn' * deltas');
    end
    finalG = G;
end

