function [ child1, child2 ] = UniformCrossOver(parent1x, parent1y, parent2x, parent2y, precision)
    
    select = randi([0 1], 1, precision); % binary mask
    
    for i = 1: precision
        if select(:, i) == 1
            child1.binx(i) = parent1x(i);
            child1.biny(i) = parent1y(i);
        else
            child1.binx(i) = parent2x(i);
            child1.biny(i) = parent2y(i);
        end
    end
    
    for i = 1: precision
        if select(:, i) == 0
            child2.binx(i) = parent1x(i);
            child2.biny(i) = parent1y(i);
        else
            child2.binx(i) = parent2x(i);
            child2.biny(i) = parent2y(i);
        end
    end
end

