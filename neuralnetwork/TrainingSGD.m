function [Ein] = TrainingSGD(network, xi, yi)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [~, L] = size(network);     
    Ein = 0;

    %do FWD Prop
    output = Theta(sum(RunForwardProp(network, xi), 1));

    %Calculate Error
    Ein = Ein + (0.5*((output-yi).^2));

    %Calculate gradient
    diff = (output - yi);
    sig = arrayfun(network(L).thetaPrime, network(L).outputs);
    deltas = diff' * sig;
    for l = L:-1:2
        deltas = network(l).backNoUpdate(deltas);
        xn = [1; network(l-1).outputThetas];
        Gn = xn*deltas';
        G = network(l).gradient;
        network(l).gradient = G - Gn;
    end
end

