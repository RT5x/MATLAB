function y = sum_int(x)
sum = 0;
n = 2^x;

for i = 1:n
    sum = sum + i;
    
end
y = sum;
end
