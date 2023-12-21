function score = scrabble_score(str)
    n = length(str);
    score = 0;
    for i = 1:n
        if (str(i) == 'q') || (str(i) =='z')
            score = score + 10;
        elseif (str(i) == 'j') || (str(i) =='x')
            score = score + 8;
        elseif str(i) == 'k'
            score = score + 5;
        elseif (str(i) == 'f') || (str(i) =='h') || (str(i) =='v') || (str(i) =='w') || (str(i) =='y')
            score = score + 4;
        elseif (str(i) == 'b') || (str(i) =='c') || (str(i) =='m') || (str(i) =='p')
            score = score + 3;
        elseif (str(i) == 'd') || (str(i) =='g')
            score = score + 2;
        else
            score = score + 1;
        end
        
    end
