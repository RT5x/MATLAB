function y = everyOther(x)

y = [];
n = length(x)
for i = 1:2:n
    y = [y x(i)]
end
end
