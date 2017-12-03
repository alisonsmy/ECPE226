function [ newcand, I ] = Proportional( candidate, parents )
   [~,I] = sort(candidate.fit);
   total = sum(I);
   [m, n] = size(I);
   prop = zeros(m, n);
   for i = 1:n
      prop(:, i) = I(:, i)/total;
      if i ~= 1
         prop(:, i) = prop(:, i-1)+prop(:, i); 
      end
   end
   
   j = 1;
   i = 1;
   while j < parents
        pick = 1*rand(1,1);
        if i > n
            i = 1;
        end
        if prop(:, i) >= pick
            newcand.binx(j,:) = candidate.binx(I(i),:);
            newcand.biny(j,:) = candidate.biny(I(i),:);
            j = j + 1;
        end
        i = i + 1;
   end
end

