function [ M, inner ] = Front( P )
    [m, ~] = size(P);
    M = [];
    inner = [];
    half = floor(m/2);
    if m == 0
        return;
    elseif m == 1
        M = P;      
    else
        [T, a] = Front(P(1:half, :));
        [B, b] = Front(P((half+1):m, :));
        [k, ~] = size(T);
        [l, ~] = size(B);
        for i = 1:l
            isDominated = false;
            for j = 1:k
                p = B(i, 2);
                t = T(j, 2);
                if p < t                   
                   isDominated = true;
                   break;
                end
            end
            if isDominated
                inner = [inner; B(i,:)];
            else
                M = [M; B(i, :)];
            end
        end
        M = [M; T];
        inner = [inner; a; b];
    end
end
