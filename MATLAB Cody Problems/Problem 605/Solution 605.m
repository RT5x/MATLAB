function y = checkvector(x)
    [m, n] = size(x);
    if (m ~= 1) & (n ~= 1)
        y = 0;
    else
        y = 1;
    end
end
