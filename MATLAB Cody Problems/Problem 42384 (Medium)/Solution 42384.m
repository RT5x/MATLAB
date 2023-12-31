function y = combined_ages2(varargin)

    n = nargin;
    
    b = cell2mat(varargin)';
    x = ones(n,n);
    i = n;
    j = 1;
    while i >= 1
        while j <= n
        x(i, j) = 0;
        i = i-1;
        j = j+1;
        end
    end
    a=x;
    y = (a\b)';
end
