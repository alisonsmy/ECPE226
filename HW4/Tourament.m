function [newcand, I] = Tourament( candidate, parents )
    [~,I] = sort(candidate.fit,'descend');
    rng('shuffle');
    for i = 1:parents
        rng(1);
        pick1 = 1+(parents-1).*rand(100, 1);
        rng(2);
        pick2 = 1+(parents-1).*rand(100, 1);

        % without replacement
        if candidate.binx(I(pick1),:) >= candidate.binx(I(pick2),:)
            newcand.binx(i,:) = candidate.binx(I(pick1),:);
        else
            newcand.binx(i,:) = candidate.binx(I(pick2),:);
        end
        
        if candidate.biny(I(pick1),:) >= candidate.biny(I(pick2),:)
            newcand.biny(i,:) = candidate.biny(I(pick1),:);
        else
            newcand.biny(i,:) = candidate.biny(I(pick2),:);
        end
        
        % with replacement
        
%         if candidate.binx(I(pick1),:) >= candidate.binx(I(pick2),:)
%             newcand.binx(i,:) = candidate.binx(I(pick1),:);
%             candidate.binx(I(pick1),:) = [];
%         else
%             newcand.binx(i,:) = candidate.binx(I(pick2),:);
%             candidate.binx(I(pick2),:) = [];
%         end
%         
%         if candidate.biny(I(pick1),:) >= candidate.biny(I(pick2),:)
%             newcand.biny(i,:) = candidate.biny(I(pick1),:);
%             candidate.biny(I(pick1),:) = [];
%         else
%             newcand.biny(i,:) = candidate.biny(I(pick2),:);
%             candidate.biny(I(pick2),:) = [];
%         end
    end
end

