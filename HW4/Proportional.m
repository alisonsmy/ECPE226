function [ newcand, I ] = Proportional( candidate, parents )
   [~,I] = sort(candidate.fit,'ascend');
   total = sum(candidate.fit(1:parents,:));
   prop = zeros(parents, 1);
   index = zeros(parents, 1);
   for i = 1:parents
      prop(i) = candidate.fit(i)/total;
      if i ~= 1
         prop(i) = prop(i-1)+prop(i); 
      end
   end
   pick = 1+(parents-1).*rand(100, 1);
   j = 1;
   for i = 1:parents
       if prop(i) >= pick
          index(j) = i;
          j = j + 1;
       end
   end
   newcand.binx(1:parents,:) = candidate.binx(index(1:parents),:);
   newcand.biny(1:parents,:) = candidate.biny(index(1:parents),:);
end

