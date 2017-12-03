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

% Selection Method:
selection = @ElitistSelection;
% selection = @Tourament;
% selection = @Proportional;

% Reproduction Strategy:
% repo = @SinglePointCrossOver;
repo = @UniformCrossOver;

% Mu Lambda policy:
policy = @PlusReproduction;
% policy = @CommaReproduction;

EvolutionaryAlgorithm(gen, pop, parents, precision, selection, repo, policy);
