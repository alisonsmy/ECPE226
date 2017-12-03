function [newcand, I] = LinearRanking(candidate, parents)
   etaplus = 1.5;
   etaminus = 2 - etaplus;
   [~,I] = sort(candidate.fit,'descend');
   prop = zeros(parents, 1);
   index = zeros(parents, 1);
   for i = 1:parents
      prop(i) = (etaplus - (((etaplus-etaminus)*(i-1))/(parents-1)))/parents;
   end
   pick = randi([0 1], 1, 1);
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

