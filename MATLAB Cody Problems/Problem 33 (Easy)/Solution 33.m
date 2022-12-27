function m = timestables(n)
m = ones(n);
m(1,:) = 1:n;
m(:,1) = 1:n;

for i = 1:n
    for j = 1:n
        m(i,j) = m(i,1)*m(1,j)
        
    end
    
end
  
  
end
