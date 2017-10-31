function [ n1, n2, n3 ] = InitialUArrangement( network, input, target)
%INITIALUARRANGEMENT Summary of this function goes here
%   Detailed explanation goes here
epsilon = 0.2;
n1 = 0;
n2 = epsilon;
n3 = 0;

netE1 = network.copy();
netE2 = network.copy();
netE3 = network.copy();

% Copy network to prevent actual changes
netE1 = UpdateNetwork(netE1, n1);
netE2 = UpdateNetwork(netE2, n2);

E1 = Error(netE1, input, target);
E2 = Error(netE2, input, target);

if E2 > E1
    n3 = 2*n2;
else
    n1 = n2;
    n2 = 0;
    n3 = -1 * epsilon;
end

netE3 = UpdateNetwork(netE3, n3);
E3 = Error(netE3, input, target);

while E3 < E2
    n1 = n2;
    n2 = n3;
    n3 = 2*n3;
    
    netE2 = UpdateNetwork(netE2, n2);
    E2 = Error(netE2, input, target);
    
    netE3 = UpdateNetwork(netE3, n3);
    E3 = Error(netE3, input, target);
end

end

