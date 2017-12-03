function [newcand, I] = LinearRanking(candidate, parents)
   etaplus = 1.5;
   etaminus = 2 - etaplus;
   [~,I] = sort(candidate.fit);
   [m, n] = size(I);
   prop = zeros(m, n);
   for i = 1:parents
      prop(:, i) = (etaplus - (((etaplus-etaminus)*(i-1))/(parents-1)))/parents;
   end
   pick = 1*rand(1,1);
   
   j = 1;
   i = 1;
   while i < n && j < parents
        if prop(:, i) >= pick
            newcand.binx(j,:) = candidate.binx(I(i),:);
            newcand.biny(j,:) = candidate.biny(I(i),:);
            j = j + 1;
        end
        i = i + 1;
   end
   if j ~= parents
       disp("do not have enough candidate!");
   end
end

