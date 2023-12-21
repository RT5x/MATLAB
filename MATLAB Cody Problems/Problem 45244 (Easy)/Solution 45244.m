function Np = findPresents(Nf,Nc)
    if Nc == 0
        Np = Nf*(Nf - 1);
    elseif Nc == 1
        Np = (Nf-1)*(Nf-2) + 2*(Nf-1);
    elseif Nf == Nc
        Np = 0;  
    else
        Np = (Nf - Nc)*(Nf - Nc - 1) + Nc*(Nf - Nc);
        
    end
end
