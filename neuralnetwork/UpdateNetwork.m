function [ result ] = UpdateNetwork( network, learningRate )
%UPDATENETWORK Summary of this function goes here
%   Detailed explanation goes here
[~, L] = size(network);
for i = 1 : L
    network(i).updateWithGradient(learningRate);
end

result = network;

end

