function [ M ] = Front( P )
    [~, m] = size(P);
    half = floor(m/2);
    M = zeros(1, m);
    if m == 1
        M = P;
    else
        [ T ] = Front(P(1, 1:half));
        [ B ] = Front(P(1, (half+1):m));
        [~, k] = size(T);
        for i = 1:k
           if B(1, 1) >= T(1, i)
               M = union(T, B(1, 1));
           end 
        end
    end
end

