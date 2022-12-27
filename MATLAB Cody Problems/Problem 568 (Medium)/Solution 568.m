function y = one(x)
r = str2num(x)

m = floor(log10(r));
D = mod(floor(r ./ 10 .^ (m:-1:0)), 10)
y = nnz(D)
  
  
end
