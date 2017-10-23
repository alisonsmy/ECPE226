function [ output ] = RunBackProp( network, initErr, learningRate)
%RUNBACKPROP Summary of this function goes here
%   Detailed explanation goes here
[L, ~] = size(network);

deltas = initErr * network(L).thetaPrime(network(3).outputThetas);
for i = L:-1:1
    deltas = network(i).back(deltas, learningRate);
end

output = network;

end

