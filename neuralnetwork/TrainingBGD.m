function [Ein] = TrainingBGD(network,training)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [~, L] = size(network);   
    [dim, N] = size(training);
    x = training(2:dim, :);
    y = training(1, :);
    
    Ein = 0;
    for i = 1:N
        
        xi = x(2:3, i);
        yi = y(i);
        
        %do FWD Prop
        output = sum(RunForwardProp(network, xi), 1);

        %Calculate Error
        Ein = Ein + (1/(2*N))*((output-yi).^2);
        
        %Calculate gradient
        diff = (output - yi);
        sig = arrayfun(network(L).thetaPrime, network(L).outputs);
        deltas = diff' * sig;
        for l = L:-1:2
            deltas = network(l).backNoUpdate(deltas);
            xn = [1; network(l-1).outputThetas];
            Gn = xn*deltas';
            G = network(l).gradient;
            network(l).gradient = G - (1/N)*Gn;
        end
    end
end

