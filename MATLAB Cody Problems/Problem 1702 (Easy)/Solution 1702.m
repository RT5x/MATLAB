function y = your_fcn_name(x)
rows = size(x,1)
cols = size(x,2)

for i = 1:rows

    r(i,:) = max(x(i,:))
    
end

y = max(r(:,1))
end
