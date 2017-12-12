function [front] = Kung(points)

    [P, I] = sort(points(1, :), 'descend');
    [front, count] = Front(P);
    
end

