classdef Layer < handle
    properties
        weights
        outputs
        outputThetas
        theta
        thetaPrime
        weightUpdate
    end
    
    methods
        % Initializes the layer
        function initRandom(obj, depth, t, tPrime, u)
            obj.weights = rand(depth, 1);
            obj.theta = t;
            obj.thetaPrime = tPrime;
            obj.weightUpdate = u;
        end
        
        % Performs forward propogation
        function h = forward(obj, xPrev)
            disp('Doing forward prop with: ');
            disp(size(obj.weights'));
            disp(size(xPrev));   
            
            obj.outputs = sum(obj.weights * xPrev', 2);
            disp(size(obj.outputs));
            
            obj.outputThetas = obj.theta(obj.outputs); 
            h = [1; obj.outputThetas'];
        end
        
        % Performs back propogation
        function deltas = back(obj, deltasPrev)
            sPrime = obj.thetaPrime(obj.outputs(end));
            deltas = sPrime .* sum(obj.weights * deltasPrev);
            obj.weights = obj.weightUpdate(obj.weights, deltas);
        end
    end
end
