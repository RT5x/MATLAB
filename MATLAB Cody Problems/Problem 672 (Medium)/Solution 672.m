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


r = [];
newvec = newvec(newvec ~= 0)


for i = 1:length(newvec)-1
    if newvec(i+1) ~= newvec(i)
        r(i) = newvec(i);
    end
end
r = r(r~=0)
if isempty(newvec)
    val = a
else
   val = r
end


if k(1) ~= 1
    val = val'
end


%val_correct = [5 5]
