function ans = your_fcn_name(n)
r = []
for i = (0:n)
    r = [r (n-i)*ones(1,n-i)]
end
ans = flip(r)
end
