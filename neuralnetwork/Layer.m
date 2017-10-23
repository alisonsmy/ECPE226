classdef Layer < handle
    properties
        weights
        outputs
        outputThetas
        theta
        thetaPrime
        weightUpdate
        gradient
    end
    
    methods
        % Initializes the layer
        function initRandom(obj, depth, t, tPrime)
            obj.weights = rand(depth, 1);
            obj.theta = t;
            obj.thetaPrime = tPrime;
            obj.gradient = zeros(depth,1);
        end
        
        % Performs forward propogation
        function h = forward(obj, xPrev)          
            obj.outputs = sum(obj.weights * xPrev', 2);
            obj.outputThetas = obj.theta(obj.outputs); 
            h = [1; obj.outputThetas'];
        end
        
        % Performs back propogation
        function deltas = back(obj, deltasPrev, eta)
            sPrime = obj.thetaPrime(obj.outputs);
            deltas = sPrime .* sum(obj.weights .* deltasPrev);
            obj.weights = obj.weights + (eta * deltas);
        end
        
        % Performs back propogation
        function deltas = backNoUpdate(obj, deltasPrev)
            sPrime = obj.thetaPrime(obj.outputs);
            deltas = sPrime .* sum(obj.weights * deltasPrev);
        end
        
        function updateWithGradient(obj, eta)
            obj.weights = obj.weights + (obj.gradient .* eta);
        end
    end
end
