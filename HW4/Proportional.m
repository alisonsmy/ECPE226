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
   pick = 1*rand(1,1);
   j = 1;
   for i = 1:n
        if prop(:, i) >= pick
            newcand.binx(j,:) = candidate.binx(I(i),:);
            newcand.biny(j,:) = candidate.biny(I(i),:);
            j = j + 1;
        end
   end
end

