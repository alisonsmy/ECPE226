function [ error ] = Error( network, input, target)
%ERROR Summary of this function goes here
%   Detailed explanation goes here
result = Theta(RunForwardProp(network, input));
error = 0.5*((target - result)^2);
end

