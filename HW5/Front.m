function [ M, f ] = Front( P, front )
    [m, ~] = size(P);
    half = floor(m/2);
    M = [];
    isDominated = false;
    inX = 0;
    inY = 0;
    if m == 1
        M = [M; P(m, :) front];
    else
        T = Front(P(1:half, :), front);
        B = Front(P((half+1):m, :), front);
        [k, ~] = size(B);
        [v, ~] = size(T);
        for i = 1:k
           for j = 1:v
               if B(i, 1) <= T(j, 1)
                   inX = 1;
               end
               if B(i, 2) <= T(j, 2)
                   inY = 1;
               end
               if not(isDominated)
                   isDominated = inX && inY; 
               end
           end
           if not(isDominated)
              M = union(T, B(i, :), 'rows');
           end
        end
    end
    f = front + 1;
end

