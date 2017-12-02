function [ child1, child2 ] = SinglePointCrossOver( parent1x, parent1y, parent2x, parent2y, precision)
%SINGLEPOINTCROSSOVER Summary of this function goes here
%   Detailed explanation goes here
crosspoint = randi([1 precision],1,1); %single point crossover
child1.binx = [parent1x(1:crosspoint),parent2x(crosspoint+1:precision)];
child2.binx = [parent2x(1:crosspoint), parent1x(crosspoint+1:precision)];
crosspoint = randi([1 precision],1,1);
child1.biny = [parent1y(1:crosspoint),parent2y(crosspoint+1:precision)];
child2.biny = [parent2y(1:crosspoint),parent1y(crosspoint+1:precision)];

end

