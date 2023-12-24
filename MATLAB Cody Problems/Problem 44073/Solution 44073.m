function [Area,Perimeter] = KochSnowFlake(side,nth)
    Perimeter = round(3*side*(4/3)^nth);
    a0 = side^2 * (0.25 * sqrt(3));
    Area = round((a0/5) * (8 - 3*(4/9)^nth));
end
