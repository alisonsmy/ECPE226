function [ output_args ] = EvolutionaryAlgorithm( gen, pop, parents, precision, SelectionMethod, ReproductionMethod, ParentPolicy )
%EVOLUTIONARYALGORITHM Summary of this function goes here
%   Detailed explanation goes here

% generate random initial population
candidate.binx = rand(pop,precision)>0.5;                   %generate binary representation
candidate.x = 10*(bi2de(candidate.binx)/(2^precision-1))-5; %convert binary representation to real [-5,5]
candidate.biny = rand(pop,precision)>0.5;
candidate.y = 10*(bi2de(candidate.biny)/(2^precision-1))-5;

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

