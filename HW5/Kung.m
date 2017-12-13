function [completed] = Kung(points, front)
    [n, ~] = size(points);
    completed = n;
    while completed > 0
        [P, ~] = sort(points, 'descend');
        pFront = Front(P);
        [a, ~] = size(pFront);
        completed = completed - a;
        if completed ~= 0
           for i = 1:a
               P(i) = [];
           end
        end
    end
end

