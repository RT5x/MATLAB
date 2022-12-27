function good = find_good_hotels(hotels,ratings,cutoff)
  
hotelTable = array2table(hotels)
ratingstable = array2table(ratings)
table = [ratingstable hotelTable]


logical = table.ratings >= cutoff
index = find(logical==1)

good = table.hotels(index)
end
