%Evolutionary Algorithm Example
% Dr. David Mueller
% Computational Intelligence - Fall 2017
%
% METHODS:
%   * Representation: Binary
%   * Selection: Elitist, Rank Selection
%   * Mating/Variation: Single Point Binary Crossover

%initialize parameters
gen = 200;
pop = 40;
parents = pop/2;
trials = 200;
precision = 8;


%generate random initial population
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
   
   newcand = ElitistSelection(candidate, parents);
   
   scatter(i,candidate.fit(I(1)));
   drawnow
   
   %create offspring - method is elitist, create 2 offspring from top 100
   % parents (#1 mates with #51, #2 with #52, etc.)
   for j = 1:parents/2
        p1x = newcand.binx(j,:);
        p1y = newcand.biny(j,:);
        p2x = newcand.binx(j+parents/2, :);
        p2y = newcand.biny(j+parents/2, :);
        [child1, child2] = SinglePointCrossOver(p1x, p2x, p2x, p2y, precision);
        newcand.binx(parents+2*j-1, :) = child1.binx;
        newcand.biny(parents+2*j-1, :) = child1.biny;
        newcand.binx(parents+2*j, :) = child2.binx;
        newcand.biny(parents+2*j, :) = child2.biny;
   end
   
   %convert children to real values [-5,5]
   newcand.x = 10*(bi2de(newcand.binx)/(2^precision-1))-5;
   newcand.y = 10*(bi2de(newcand.biny)/(2^precision-1))-5;
   
   %copy selected parents and new children to candidate population
   candidate = newcand;
end