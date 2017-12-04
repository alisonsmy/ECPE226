function [ candidate ] = RandomPop( pop, precision )

    candidate.binx = rand(pop,precision)>0.5;                   %generate binary representation
    candidate.x = 10*(bi2de(candidate.binx)/(2^precision-1))-5; %convert binary representation to real [-5,5]
    candidate.biny = rand(pop,precision)>0.5;
    candidate.y = 10*(bi2de(candidate.biny)/(2^precision-1))-5;

end

