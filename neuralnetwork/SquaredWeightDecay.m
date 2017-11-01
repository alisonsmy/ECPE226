function [Eaugs] = SquaredWeightDecay(network, training)
    
    [~, L] = size(network);
    x = training(3:d, :);
    y = training(1, :);
    lambda = 0.01;
    Eaugs = zeros(L, 1);
    Eaug = zeros(L, 1);
    sum = 0;
    for l = L:-1:2
       [N, D] = size(network(l).weights);
       for i = 1:N
           for j = 1:D
               sum = sum + (network(l).weights(i, j))^2;               
           end 
       end
       get = (lambda/N)*sum;
       % The gradient is calculated from the sensitivities we calculate in back-propagation
       i = randi([1 N], 1); % get a random integer from 1 to N
       Ein = TrainingSGD(network, x(:,i), y(i));
       Eaug(l, :) = Ein + get;
    end
    for l = 1:L
        Eaugs(l, :) = (Eaug(l, :)/network(l).weights);
    end
end

