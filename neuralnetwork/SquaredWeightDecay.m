function [Eaugs] = SquaredWeightDecay(network, training)
    
    [~, L] = size(network);
    x = training(3:d, :);
    y = training(1, :);
    lambda = 0.01;
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
    for l = L:-1:2
        deltas = network(l).backNoUpdate(Eaug);
        xn = [1; network(l-1).outputThetas];
        Gn = xn*deltas';
        G = network(l).gradient;
        network(l).gradient = G + Gn;
        if any(isnan(network(l).gradient(:)))
            frprintf('nans on line 29 SquaredWeightDecay!');
        end
    end
    Eaugs = deltas;
end

