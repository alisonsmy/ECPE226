function [completed] = Naive( pop, front)
%NAIVE Summary of this function goes here
%   Detailed explanation goes here

[~, N] = size(pop);

pFront = [];
pInner = [];

% for all points
for p = 1:N
    domX = 0;
    domY = 0;
    isDominated = false;
    for other = 1:N
        if p ~= other
            inX = pop(1, p) > pop(1, other);
            inY = pop(2, p) > pop(2, other);
            if inX
                domX = domX + 1;
            end
            if inY
                domY = domY + 1;
            end
            if not(isDominated)
                isDominated = inX && inY;
            end
        end
    end
    if isDominated
        pFront = [pFront  [pop(1, p) pop(2,p) (domX + domY) front]];
    else
        pInner = [pInner pop(p)];
    end
end

if isempty(pInner)
    completed = pFrontl;
else
    completed = [pFront Naive(pInner, front + 1)];
end

end

