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

EvolutionaryAlgorithm(gen, pop, parents, precision, @ElitistSelection, @SinglePointCrossOver);