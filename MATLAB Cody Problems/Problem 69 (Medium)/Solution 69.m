function pmax = peakOfPeaks(nmax)
c = ones(nmax);
c(1:nmax,1) = 1:nmax;
for j = 1:nmax
    for i = 1:nmax
        if mod(c(j,i),2) == 0;
            c(j,i+1) = c(j,i) / 2;
            
        else
            c(j,i+1)=(3*c(j,i) + 1);
            
        end
        
    end
end

pmax = max(max(c))
end
