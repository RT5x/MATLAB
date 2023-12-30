function y = isOrthogonal(x)
    [m, n] = size(x);
    
    if m~= n
        y = false;
        
    else
        if round(inv(x)) == round(x.')
            y = true;
        else
            y = false;
        end
    end
end
