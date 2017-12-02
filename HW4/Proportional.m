function [ newcand, I ] = Proportional( candidate, parents )
   [~,I] = sort(candidate.fit,'ascend');
   total = sum(candidate.fit);
   [m, n] = size(I);
   prop = zeros(m, n);
   index = zeros(m, n);
   for i = 1:I
      prop(i) = candidate.fit(i)/total;
   end
   pick = randi([0 1], 1, 1);
   j = 1;
   for i = 1:I
       if prop(i) >= pick
          index(j) = i;
          j = j + 1;
       end
   end
   newcand.binx(1:parents,:) = candidate.binx(index(1:parents),:);
   newcand.biny(1:parents,:) = candidate.biny(index(1:parents),:);
end

