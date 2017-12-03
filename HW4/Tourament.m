function [newcand, I] = Tourament( candidate, parents )
   [~,I] = sort(candidate.fit,'descend');
   pick = 1+(parents-1).*rand(100, 1);
   
   
   newcand.binx(1:parents,:) = candidate.binx(I(1:parents),:);
   newcand.biny(1:parents,:) = candidate.biny(I(1:parents),:);
end

