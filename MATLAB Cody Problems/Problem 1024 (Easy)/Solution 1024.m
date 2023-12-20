function B = duplicate_indices(A)
    B = linspace(A(1), A(length(A)), 2*length(A))
    i = 1;
    j = 1;
    while i < length(B)
        if rem(i,2) == 0
            B(i) = A(i/2);
            i = i+1;
        else 
            B(i) = A((i+1)/2);
            i = i+1;
        end
    end
end
