function y = minkowski(v1,v2,p)
    sum = 0;
    for i = 1:length(v1)
        sum = sum + (abs(v1(i) - v2(i)))^p;
    end
    y = round(sum^(1/p), 4);
end
