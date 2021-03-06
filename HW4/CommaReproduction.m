function [ lambdas ] = CommaReproduction( newcand, parents, precision, pop, ReproductionMethod)
   for j = 1:parents/2
        p1x = newcand.binx(j,:);
        p1y = newcand.biny(j,:);
        p2x = newcand.binx(j+parents/2, :);
        p2y = newcand.biny(j+parents/2, :);
        [child1, child2] = ReproductionMethod(p1x, p1y, p2x, p2y, precision);
        lambdas.binx(2*j-1, :) = child1.binx;
        lambdas.biny(2*j-1, :) = child1.biny;
        lambdas.binx(2*j, :) = child2.binx;
        lambdas.biny(2*j, :) = child2.biny;
   end
   lambdas.x = 10*(bi2de(lambdas.binx)/(2^precision-1))-5;
   lambdas.y = 10*(bi2de(lambdas.biny)/(2^precision-1))-5;
   filler = RandomPop(pop - (length(lambdas)), precision);
   l = length(lambdas.x);
   for i = 1:length(filler.x)
       lambdas.x(l + i, :) = filler.x(i,:);
       lambdas.binx(l + i, :) = filler.x(i,:);
       lambdas.y(l + i, :) = filler.y(i,:);
       lambdas.biny(l + i, :) = filler.biny(i,:);
   end
end