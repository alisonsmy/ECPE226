function [ output ] = ApplyVector( a, b )
%APPLYVECTOR Summary of this function goes here
%   Detailed explanation goes here
f = @(x) sum(x*a);
output = arrayfun(f, b);
end

