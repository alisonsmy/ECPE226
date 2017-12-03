function [ newcand, I ] = PlusComma( candidate, parents )
   [~,I] = sort(candidate.fit,'descend');
    
   newcand.binx(1:parents,:) = candidate.binx(I(1:parents),:);
   newcand.biny(1:parents,:) = candidate.biny(I(1:parents),:);
   
end

