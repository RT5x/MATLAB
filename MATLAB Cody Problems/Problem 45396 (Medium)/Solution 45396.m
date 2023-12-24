function y = tubesheet(D)
    r = D/2;
    sum = 0;
    
    for i = 1:r
        for j = 1:r
            x = i;
            y = j;
            if x^2 + y^2 <= r^2
                sum = sum + 1;
            else
                sum = sum + 0;
            end
        end
        
    end
    
    y = 4*sum;
end
