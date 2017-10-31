function [Ein] = TrainingSGD(network, xi, yi)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [~, L] = size(network);     


    %do FWD Prop
    output = RunForwardProp(network, xi);

    %Calculate Error
    Ein = Error(network, xi, yi);

    %Calculate gradient
    diff = (output - yi);
    sig = network(L).outputThetas;
    deltas = diff' * sig;
    for l = L:-1:2
        deltas = network(l).backNoUpdate(deltas);
        xn = [1; network(l-1).outputThetas];
        Gn = xn*deltas';
        G = network(l).gradient;
        network(l).gradient = G + Gn;
        if any(isnan(network(l).gradient(:)))
            frprintf('nans on line 23 TrainingSGD!');
        end
    end          
end

