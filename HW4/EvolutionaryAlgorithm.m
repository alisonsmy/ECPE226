function [ output_args ] = EvolutionaryAlgorithm( gen, pop, parents, precision, SelectionMethod, ReproductionMethod, ParentPolicy )
%EVOLUTIONARYALGORITHM Summary of this function goes here
%   Detailed explanation goes here

% generate random initial population
candidate = RandomPop(pop, precision);

figure; hold on;

for i = 1:gen 
   %evaluate objective/fitness
   for j = 1:pop
       candidate.fit(j) = exp(-((candidate.x(j)-3)^2+(candidate.y(j)-3)^2)/5) + 0.8*exp(-(candidate.x(j)^2+(candidate.y(j)+3)^2)/5) + 0.2*(cos(candidate.x(j)*pi/2)+cos(candidate.y(j)*pi/2)) + 0.5; 
   end
   
   [newcand, I] = SelectionMethod(candidate, parents);
   
   scatter(i,candidate.fit(I(1)));
   drawnow
   
   [ newcand ] = ParentPolicy(newcand, parents, precision, pop, ReproductionMethod);
   
   %copy selected parents and new children to candidate population
   candidate = newcand;
end

end

