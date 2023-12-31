function v = system_eq(a)
    [m,n] = size(a);
    b = a(:,n);
    a = a(:,1:n-1);
    v = round((a\b)');
end
