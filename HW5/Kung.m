function [result] = Kung(points, frontN)
    [L, ~] = size(points);
    if L == 0
        result = [];
    elseif L == 1
        result = [points(1,1) points(1,2) 0 frontN];
    else
        result = [];
        [P,~] = sortrows(points, -1);
        [front, inner] = Front(P);
        P = [front; inner];
        [N, ~] = size(front);
        [M, ~] = size(P);
        for p = 1:N
            dom = 0;
            for other = 1:M
                if p ~= other
                    if P(p,1) > P(other, 1)
                        dom = dom + 1;
                    end
                    if P(p,2) > P(other,2)
                        dom = dom + 1;
                    end
                end
            end
            pf1 = P(p,1);
            pf2 = P(p,2);
            result = [result; [pf1 pf2 dom frontN]];
        end
        result = [result; Kung(inner, frontN+1)];
    end
end

