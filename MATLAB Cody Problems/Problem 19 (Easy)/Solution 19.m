function B = swap_ends(A)
[m,n] = size(A);
B = A;
B(:,1) = A(:,n);
B(:,n) = A(:,1);
end
