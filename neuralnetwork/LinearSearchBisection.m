function [ learningRate ] = LinearSearchBisection( network, input, target )
%LINEARSEARCHBISECTION Summary of this function goes here
%   Detailed explanation goes here
[n1,n2,n3] = InitialUArrangement();
netEnHat = 0;
netE2 = 0;

tolerance = 0.1;
iter = 1;
perterb = 0.1;

while abs(n3 - n1) > tolerance && iter < 20
    
    nHat = 0.5*(n1 + n3);
    % Copy network to prevent actual changes
    copyobj(network, [netEnHat, netE2]);
    netEnHat = UpdateNetwork(netEnHat, nHat);
    netE2 = UpdateNetwork(netE2, n2);
    
    if nHat < n2
        En = Error(netEnHat, input, target);
        E2 = Error(netE2, input, target);
        if En < E2
            n3 = n2;
            n2 = nHat;
        elseif En > E2
            n1 = nHat;
        end
    elseif nHat > n2
        En = Error(netEnHat, input, target);
        E2 = Error(netE2, input, target);
        if En < E2
            n1 = n2;
            n3 = n2;
            n2 = nHat;
        elseif En > E2
            n3 = nHat;
        end
    else 
        nHat = nHat + perterb;
    end
end

learningRate = nHat;

end

