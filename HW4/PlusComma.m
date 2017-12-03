function [ f ] = PlusComma( precision, mu)
    f = @(x,y) impl(x,y,precision, mu);  
end

function [ newcand, I ] = impl( candidate, parents, precision, mu)
    [newcand, I] = ElitistSelection(candidate, mu);
    filler = RandomPop(parents - mu, precision);
    newcand = [ newcand filler ]
   
end