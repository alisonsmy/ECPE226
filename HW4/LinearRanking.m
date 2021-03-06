function [newcand] = LinearRanking(candidate, parents)
   etaplus = 1.5;
   etaminus = 2 - etaplus;
   [~,I] = sort(candidate.fit);
   [m, n] = size(candidate.fit);
   prop = zeros(m, n);
   for i = 1:n
      prop(:, i) = (etaplus - (((etaplus-etaminus)*(i-1))/(n-1)))/n;
   end
   
   j = 1;
   i = 1;
   while j < parents
        pick = rand(1,1);
        if prop(:, i) >= pick
            newcand.binx(j,:) = candidate.binx(I(:, i),:);
            newcand.biny(j,:) = candidate.biny(I(:, i),:);
            j = j + 1;
            i = 1;
        else
            i = i + 1;
            if i > n
                i = 1;
            end
        end
   end
end

