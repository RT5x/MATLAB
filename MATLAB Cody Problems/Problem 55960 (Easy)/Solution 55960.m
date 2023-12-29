function loc = whereami(x,y)
    inner_sq = ((x > -0.5) & (x < 0.5)) & ((y > -0.5) & (y < 0.5));
    if inner_sq
        loc = "NN";
    elseif (~inner_sq) & ((y > 0) & (x > 0))
        loc = "CO";
    elseif (~inner_sq) & ((y > 0) & (x < 0))
        loc = "UT";
    elseif (~inner_sq) & ((y < 0) & (x > 0))
        loc = "NM";
    elseif (~inner_sq) & ((y < 0) & (x < 0))
        loc = "AZ";
    end
end
