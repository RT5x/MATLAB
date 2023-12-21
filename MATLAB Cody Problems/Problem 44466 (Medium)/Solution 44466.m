% Advent of Code, Day 5
function accumulatedGifts = twelvetide(day)
    sum = 1;
    if day == 1
        accumulatedGifts = 1;
    elseif (day <= 0)
        accumulatedGifts = 0;
    elseif day > 12
        accumulatedGifts = 364;
    else
        for i = 2:day
            sum = sum + (0.5*i*(i+1));
        end
        accumulatedGifts = sum;
    end
end
