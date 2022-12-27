function y = reverseVector(x)
y = [];
n = length(x);
for i = n:-1:1
     y = [y x(i)]
end
end
