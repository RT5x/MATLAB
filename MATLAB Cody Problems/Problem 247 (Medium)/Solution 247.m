function y = desSort(x)
    n = length(x);
    i=1;
    j=1;
    while i < (n)
        while j < (n)
            if x(j+1) > x(i)
                x([i;j+1]) = x([j+1;i]);
                j = j+1;
                
            else
                j= j+1;
            end
            
        end
        i = i+1;
        j=i;
    end
    y=x;
end
