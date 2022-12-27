function z = in_prod(x,y)
    [xrows xcol] = size(x)
    [yrows ycol] = size(y)
    
    if xcol ~= yrows
        z = "Have you checked the inner dimensions?"
    else
            z = x*y  
    end
end
