function [ t ] = Theta( s )
%THETA Summary of this function goes here
%   Detailed explanation goes here
bottom = (1 + exp(-s));
if bottom ~= 0
    t = (1/bottom);
else
    t = 0;
end

end

