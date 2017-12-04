%Evolutionary Algorithm Example
% Dr. David Mueller
% Computational Intelligence - Fall 2017
%
% METHODS:
%   * Representation: Binary
%   * Selection: Elitist, Rank Selection
%   * Mating/Variation: Single Point Binary Crossover

% NUMERICAL PARAMETERS
gen = 200;
pop = 40;
parents = pop/2;
trials = 200;
precision = 8;

% SELCTION METHOD:
% selection = @ElitistSelection;
selection = @Tourament;
% selection = @Proportional;
% selection = @LinearRanking;

% REPRODUCTION STRATEGY:
% repo = @SinglePointCrossOver;
repo = @UniformCrossOver;

% MU LAMBDA POLICY:
policy = @PlusReproduction;
% policy = @CommaReproduction;

EvolutionaryAlgorithm(gen, pop, parents, precision, selection, repo, policy);
