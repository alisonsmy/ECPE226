function [ error ] = Error( network, input, target)
%ERROR Summary of this function goes here
%   Detailed explanation goes here
result = RunForwardProp(network, input);
if target == 0
    z =100;
end
error = 0.5*((result - target)^2);
end

