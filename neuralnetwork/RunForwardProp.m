function [ output ] = RunForwardProp( network, dataPoint)
%RUNFORWARDPROP Summary of this function goes here
%   Detailed explanation goes here

[~,L] = size(network);
input = dataPoint;

for i = 1:L
    input = network(i).forward(input);
end

output = input;

end

