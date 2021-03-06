function [ newcand ] = Proportional( candidate, parents )

   [~,I] = sort(candidate.fit);
   total = sum(candidate.fit);
   [m, n] = size(candidate.fit);
   prop = zeros(m, n);
   
   for i = 1:n
      prop(:, i) = candidate.fit(I(:, i))/total;
      if i ~= 1
         prop(:, i) = prop(:, i-1)+prop(:, i); 
      end
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

