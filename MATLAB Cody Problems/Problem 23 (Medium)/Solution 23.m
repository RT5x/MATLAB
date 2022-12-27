function b = isItSquared(a)
r = []
z = size(a,2)
for i = (1:z)
    for j = (1:z)
        if a(i) == (a(j))^2
            r(1,i) = true;
        else
            continue
        end
    
    end
end

n = nnz(r)
if n ~= 0
    b = true
else
    b = false
end
