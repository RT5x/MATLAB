function B = column_removal(A,n)
[m,v] = size(A)
B = A;
  B(:,n) = B(:,n+1)
  
for i = n+1:v-1
     B(:,i) = B(:,i+1)
   
end
  B(:,v) = []
end
