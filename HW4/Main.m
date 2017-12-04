% Jeffery Dwyer, Alison Shu
% Dr. David Mueller
% Computational Intelligence - Fall 2017
% HW4 - Evolutionary Algorithm
% 12/03/2017

% NUMERICAL PARAMETERS
gen = 200;
pop = 40;
parents = pop/2;
trials = 200;
precision = 8;

% SELCTION METHOD:
selection = @ElitistSelection;
% selection = @Tourament;
% selection = @Proportional;
% selection = @LinearRanking;

% REPRODUCTION STRATEGY:
repo = @SinglePointCrossOver;
% repo = @UniformCrossOver;

% MU LAMBDA POLICY:
% policy = @PlusReproduction;
policy = @CommaReproduction;

figure; hold on;
for i = 1:200
    best = EvolutionaryAlgorithm(gen, pop, parents, precision, selection, repo, policy);
    scatter(i, mean(best));
end
