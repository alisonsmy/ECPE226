function [newcand] = Tourament( candidate, parents )
    % [~,I] = sort(candidate.fit,'descend');
    rng('shuffle');
    for i = 1:parents
        pick1 = randi([1 parents*2], 1, 1);
        pick2 = randi([1 parents*2], 1, 1);
        
        % without replacement
        if candidate.fit(:, pick1) >= candidate.fit(:, pick2)
            newcand.binx(i,:) = candidate.binx(pick1,:);
            newcand.biny(i,:) = candidate.biny(pick1,:);
        else
            newcand.binx(i,:) = candidate.binx(pick2,:);
            newcand.biny(i,:) = candidate.biny(pick2,:);
        end
        
        % with replacement
        
%         if candidate.fit(:, pick1) >= candidate.fit(:, pick2)
%             newcand.binx(i,:) = candidate.binx(pick1,:);
%             newcand.biny(i,:) = candidate.biny(pick1,:);
%             candidate.fit(:, pick1) = 0;
%         else
%             newcand.binx(i,:) = candidate.binx(pick2,:);
%             newcand.biny(i,:) = candidate.biny(pick2,:);
%             candidate.fit(:, pick2) = 0;
%         end
        
    end
end

