function [ Eins ] = VariableLearningRate(training, testing, network, lr)
    % For variable learning rate, you will need to compare two errors.
    % The error of the network with its current weights – this error will be the one you’ve already calculated in the stochastic algorithm.
    % The error of the network with the possible future weights (w(t+1) = w(t) - lr*g(t)).
    
    [d, N] = size(training);
    [~, M] = size(testing);
    [~, L] = size(network);
    
    % The error of the network with its current weights
    CurrentEr = 0;

    x = training(3:d, :);
    y = training(1, :);

    a = 1;  %1.05 <= a <= 1.1
    B = 0.7; %.5 <= B <= .8
    t = 1;
    prevError = -1;
    errorSimilarity = 0;
    threshold = 20;
    Eins = zeros(1000,1);

    while errorSimilarity < threshold && t < 1000
        for l = L:-1:2
            % The gradient is calculated from the sensitivities we calculate in back-propagation
            EinNow = TrainingSGD(network, x(:,t), y(t));
            % w(t) - lr*g(t))
            candidate = network.copy();
            UpdateNetwork(candidate, lr);
            % The error of the network with the possible future weights
            ErNext = Error(candidate, x(:,t), y(t));
            if ErNext < EinNow
               network = candidate;
               lr = a*lr;
               Eins(t) = ErNext;
            else
               lr = B*lr;
               Eins(t) = EinNow;
            end
        end
         t = t + 1;
         
        % Calculate Error
        errors = 0;
        for i = 1:M
            xi = testing(3:d,i);
            output = RunForwardProp(network, xi);
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

