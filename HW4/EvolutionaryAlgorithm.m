function [ best ] = EvolutionaryAlgorithm( gen, pop, parents, precision, SelectionMethod, ReproductionMethod, ParentPolicy )
%EVOLUTIONARYALGORITHM Summary of this function goes here
%   Detailed explanation goes here

% generate random initial population
candidate = RandomPop(pop, precision);

%figure; hold on;
best = zeros(1,200);
for i = 1:gen 
   %evaluate objective/fitness
   genBest = 0;
   for j = 1:pop
       f = exp(-((candidate.x(j)-3)^2+(candidate.y(j)-3)^2)/5) + 0.8*exp(-(candidate.x(j)^2+(candidate.y(j)+3)^2)/5) + 0.2*(cos(candidate.x(j)*pi/2)+cos(candidate.y(j)*pi/2)) + 0.5;
       candidate.fit(j) = f;
       if f > genBest
           genBest = f;
       end
   end
   best(i) = genBest;
   
   newcand = SelectionMethod(candidate, parents);
   
%    scatter(i,genBest);
   drawnow
   
   [ newcand ] = ParentPolicy(newcand, parents, precision, pop, ReproductionMethod);
   
   %copy selected parents and new children to candidate population
   candidate = newcand;
end

end

