function [ newcand ] = ElitistSelection( candidate, parents )
%ELITISTSELECTION Summary of this function goes here
%   Detailed explanation goes here
   [~,I] = sort(candidate.fit,'descend');
   newcand.binx(1:parents,:) = candidate.binx(I(1:parents),:);
   newcand.biny(1:parents,:) = candidate.biny(I(1:parents),:);

end

