a = [1 2 3 4 5 5 5 1 1 5 5 5]';



val = [];
newvec = [];
count = 0;
for i = 1:length(a)-1
    if a(i+1) == a(i)
        count = count + 1;
        newvec(i) = a(i);
        newvec(i+1) = a(i+1);
    end
    
end
k = size(a);



newvec = newvec(newvec ~= 0);
z = histc(newvec, unique(newvec));
z1 = newvec(z);

if isempty(newvec)
    val = a
else
   val = z1;
end


if k(1) ~= 1
    val = val'
end
