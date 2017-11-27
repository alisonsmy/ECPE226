%Evolutionary Algorithm Example
% Dr. David Mueller
% Computational Intelligence - Fall 2017
%
% METHODS:
%   * Representation: Binary
%   * Selection: Elitist, Rank Selection
%   * Mating/Variation: Single Point Binary Crossover

%initialize parameters
pop = 200;
gen = 200;
precision = 8;
parents = pop/2;

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
   
   %select parents - method here is rank selection; purely elitist
   [~,I] = sort(candidate.fit,'descend');
   newcand.binx(1:parents,:) = candidate.binx(I(1:parents),:);
   newcand.biny(1:parents,:) = candidate.biny(I(1:parents),:);
   
   scatter(i,candidate.fit(I(1)));
   drawnow
   
   %create offspring - method is elitist, create 2 offspring from top 100
   % parents (#1 mates with #51, #2 with #52, etc.)
   for j = 1:parents/2
       crosspoint = randi([1 precision],1,1); %single point crossover
       newcand.binx(parents+2*j-1,:) = [newcand.binx(j,1:crosspoint),newcand.binx(j+parents/2,crosspoint+1:precision)];
       newcand.binx(parents+2*j,:) = [newcand.binx(j+parents/2,1:crosspoint),newcand.binx(j,crosspoint+1:precision)];
       crosspoint = randi([1 precision],1,1);
       newcand.biny(parents+2*j-1,:) = [newcand.biny(j,1:crosspoint),newcand.biny(j+parents/2,crosspoint+1:precision)];
       newcand.biny(parents+2*j,:) = [newcand.biny(j+parents/2,1:crosspoint),newcand.biny(j,crosspoint+1:precision)];
   end
   
   %convert children to real values [-5,5]
   newcand.x = 10*(bi2de(newcand.binx)/(2^precision-1))-5;
   newcand.y = 10*(bi2de(newcand.biny)/(2^precision-1))-5;
   
   %copy selected parents and new children to candidate population
   candidate = newcand;
end