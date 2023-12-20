function y = flip_vector(x)
    n = length(x);
    i = 1;
    while i < n+1
        y(i) = x(n + 1 - i);
        i = i+1;
    end
end
