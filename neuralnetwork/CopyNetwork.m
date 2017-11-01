function [ copy ] = CopyNetwork( network )
%COPYNETWORK Summary of this function goes here
%   Detailed explanation goes here
copy = [network(1).copy(), network(2).copy()];

end

