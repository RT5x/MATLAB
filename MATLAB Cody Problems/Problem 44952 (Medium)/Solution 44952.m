function mpg = sort_cars(N)
load("cars.mat")
table_Sorted = sortrows(cars,"Weight","ascend")
mpg = table_Sorted.MPG(1:N)

end
