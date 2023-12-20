function z = your_fcn_name(x,y)
  z = 0;
    i = 1;
    while i <= length(x)
        z = z + x(i)*y(i);
        i = i + 1;
    end
end
