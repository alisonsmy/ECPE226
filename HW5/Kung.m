function [completed] = Kung(points, front)

    pfront = 0;
    [P, ~] = sort(points, 'descend');
    [f] = Front(P);
    [n, d] = size(f);
    pfront = pfront + n;
    completed = 0;
end

