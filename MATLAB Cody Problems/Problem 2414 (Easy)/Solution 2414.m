function MA = MA_gear_train(gears)
[m, n] = size(gears);
MA = 1;
for i = 1:n
    MA = MA*(gears(1,i)/gears(2,i))
end

end
