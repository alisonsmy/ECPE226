function [w] = TrainingVLRGD(training, testing, network, lr)
    %UNTITLED3 Summary of this function goes here
    %   Detailed explanation goes here
    Eins = StochasticGradientDescent(training, testing, network, lr);
    g = zeros(1000, 1);
    v = zeros(1000, 1);
    a = 1;  %1.05 <= a <= 1.1
    B = 0.7; %.5 <= B <= .8
    VLR = 0; %n0
    t = 0;
    prevError = -1;
    errorSimilarity = 0;
    threshold = 20;
    while errorSimilarity < threshold && iter < 1000 && Ein >= 0.2
        g(t, :) = Eins(t, :);
        v(t, :) = -(g(t, :));
        index = wt + VLR*v(t, :);
        if Eins(index, :) < Eins(wt, :)
           network(1).weights(t+t, :) = index;
           VLR = a*VLR;
        else
           network(1).weights(t+1, :) = wt;
           VLR = B*VLR;
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

