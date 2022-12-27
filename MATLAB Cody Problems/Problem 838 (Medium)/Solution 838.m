function y = existsInVector(a,b)
 r = nnz(b==a)
if r == 0
    y = 0
else
    y = 1
end
end
