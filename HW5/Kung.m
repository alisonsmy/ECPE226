function [front] = Kung(vector)
    [P, I] = sort(vector(1, :), 'descend');
    front = Front(P);
    [N, d] = size(front);
    % vector would be x, y, color
end

