function [ newcand ] = PlusReproduction( newcand, parents, precision, ReproductionMethod)
%PLUSREPRO Summary of this function goes here
%   Detailed explanation goes here
   for j = 1:parents/2
        p1x = newcand.binx(j,:);
        p1y = newcand.biny(j,:);
        p2x = newcand.binx(j+parents/2, :);
        p2y = newcand.biny(j+parents/2, :);
        [child1, child2] = ReproductionMethod(p1x, p1y, p2x, p2y, precision);
        newcand.binx(parents+2*j-1, :) = child1.binx;
        newcand.biny(parents+2*j-1, :) = child1.biny;
        newcand.binx(parents+2*j, :) = child2.binx;
        newcand.biny(parents+2*j, :) = child2.biny;
   end

end

