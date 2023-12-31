function y = isnilpotent(A)
    [m,n] = size(A);
    if m~=n
        y = false;
    
    else
        e = eig(A);
        z=nnz(round(imag(e)));
    
        if (z ==0)& (round(det(A)) == 0)
            y = true;
        else
            y = false;
        end
    end
end
