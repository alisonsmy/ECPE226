function err = FindError(h, y)
    [n, d] = size(h);
    err = sum(abs(h-y))/(2*n);
end