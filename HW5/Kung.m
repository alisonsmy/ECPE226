function [completed, f] = Kung(pop, front)
    [n, ~] = size(pop);
    finish = n;
    p = pop;
    completed = [];
    while finish > 0
        [n, ~] = size(p);
        [~, I] = sort(p(:, 1));
        P = p(I(1:n), 1:2);
        [sub, f] = Front(P, front);
        completed = [completed; sub];
        [subN, ~] = size(sub);
        finish = finish - subN;
        p = setdiff(p, sub(:, 1:2), 'rows');
        front = f;
    end
end

