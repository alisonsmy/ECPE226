function [completed] = Naive( pop, front)

[N, ~] = size(pop);

pFront = [];
pInner = [];

% for all points
for p = 1:N
    domX = 0;
    domY = 0;
    isDominated = false;
    for other = 1:N
        if p ~= other
            inX = pop(p,1) <= pop(other, 1);
            inY = pop(p,2) <= pop(other,2);
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
       pInner = [pInner; pop(p, :)];
        
    else
       pFront = [pFront;  [pop(p, 1) pop(p,2) (domX + domY) front]];
    end
end

if isempty(pInner)
    completed = pFront;
else
    completed = [pFront; Naive(pInner, front + 1)];
end

end

