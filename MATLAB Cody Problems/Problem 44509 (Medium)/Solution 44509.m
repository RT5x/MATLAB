function y = isValidAHP(x)
  [m, n] = size(x);

    if m~=n
        y = false;
    else
        for i = 1:m
            for j = 1:n
                
                if i==j
                    if (x(i,j)==1);
                        y = true;
                        continue
                    else
                        y = false;
                        break
                    end             
                else
                    if (round(x(i,j)) == round(1/x(j,i)));
                        y = true;
                        continue
                    else
                        y = false;
                        break
                    end
                end 
                
            end
         if y == false;
            break;
         end
        end
          
    end
end
