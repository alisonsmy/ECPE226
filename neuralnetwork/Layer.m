classdef Layer < handle
    properties
        weights
        outputs
        theta
        thetaPrime
        weightUpdate
    end
    
    methods
        function h = forward(obj, xPrev)
            s = dot(obj.weights, xPrev);
            obj.outputs = [1 obj.theta(s)];
            h = obj.outputs;
        end
        
        function deltas = back(obj, deltasPrev)
            sPrime = obj.thetaPrime(obj.outputs(2:end));
            deltas = sPrime .* dot(obj.weights,deltasPrev);
            obj.weights = obj.weightUpdate(obj.weights, deltas);
        end
    end
end
