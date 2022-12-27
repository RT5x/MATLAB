function tf = mono_increase(x)
foo = [];
n = length(x);
for i = 1:n-1
    foo = [foo (x(i+1) > x(i))]
end
foo = mean(foo)

tf = (foo.*1) .* (foo==1)


end
