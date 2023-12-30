function tf = ortho_normal(A)
    [m,n] = size(A);
    for i = 1:n
       for j = i+1:n
           if ((dot(A(:,i), A(:,j)) == 0) & (norm(A(:,i))==1))
               tf = true;
               continue;
           else
               tf = false;
               break;
           end
       end
       if tf == false
           tf = false;
           break;
       end
       
    end
end
