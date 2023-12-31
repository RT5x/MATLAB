function [tf] = projector_matrix(P)

    if (round(P^2) == round(P))
        tf = true;
    else
       tf = false; 
    end

end
