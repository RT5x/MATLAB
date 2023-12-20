function y = array_maximum(x)
    i = 1;
    y = x;
    [m, n]= size(x);
    while i < m+1
        y = max(y);
        i = i+1;
    end
end
