function [ M, count ] = Front( P )
    count = 0;
    [~, m] = size(P);
    half = floor(m/2);
    M = zeros(1, m);
    if m == 1
        M = P;
        count = count + 1;
    else
        [T, a] = Front(P(1, 1:half));
        [B, b] = Front(P(1, (half+1):m));
        count = count + a + b;
        [~, k] = size(T);
        for i = 1:k
           if B(1, 1) >= T(1, i)
               M = union(T, B(1, 1));
               count = count + 2;
           end 
        end
    end
end

