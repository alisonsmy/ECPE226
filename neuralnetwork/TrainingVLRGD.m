function [network] = TrainingVLRGD(training, testing, network, lr)
    % For variable learning rate, you will need to compare two errors.
    % The error of the network with its current weights � this error will be the one you�ve already calculated in the stochastic algorithm.
    % The error of the network with the possible future weights (w(t+1) = w(t) - lr*g(t)).
    
    % The error of the network with its current weights
    CurrentEr = StochasticGradientDescent(training, testing, network, lr);

    a = 1;  %1.05 <= a <= 1.1
    B = 0.7; %.5 <= B <= .8
    t = 0;
    prevError = -1;
    errorSimilarity = 0;
    threshold = 20;
    
    while errorSimilarity < threshold && iter < 1000 && Ein >= 0.2
        for l = L:-1:2
            % The gradient is calculated from the sensitivities we calculate in back-propagation
            g = network(l).deltas(t, :);
            % w(t) - lr*g(t))
            measure = network(l).weights(t,:) - lr*g;
            % The error of the network with the possible future weights
            ErNext = Error(network, measure, testing(1,t));
            if ErNext < CurrentEr(t, :)
               network(l).weights(t+t, :) = measure;
               lr = a*lr;
            else
               network(l).weights(t+1, :) = network(l).weights(t, :);
               lr = B*lr;
            end
        end
         t = t + 1;
         
        % Calculate Error
        errors = 0;
        for i = 1:M
            xi = testing(3:d,i);
            output = sum(RunForwardProp(network, xi), 1);
            target = testing(1,i);
            errors = errors + ((output - target)^2);
        end
        error = errors/(2*M);
        % Determine if algorithm should stop
        if abs(error - prevError) < 0.00001
            errorSimilarity = errorSimilarity + 1;
        else
            errorSimilarity = 0;
        end
        prevError = error;
    end
end

