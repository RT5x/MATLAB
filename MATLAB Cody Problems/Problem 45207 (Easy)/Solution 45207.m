function num = daysUntilChristmas(y,m,d)
    date = datetime(y, m, d)
    
    if m < 12
        diff = (datetime(y, 12, 25) - date);
        num = hours(diff)/24;
    
    elseif m == 12 & d > 25
        
        diff = (datetime(y+1, 12, 25) - date);
        num = hours(diff)/24;
        
    end
end
