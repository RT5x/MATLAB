function y = how_many_days(x)

    sum = 0;
    for i = 1:x
        sum = sum + (0.5*i*(i+1));
    end
    y = sum;
end
