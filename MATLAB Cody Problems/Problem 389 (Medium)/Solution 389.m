function y = your_fcn_name(M)
    [m,k] = size(M);
    sqrt(dot(M(:,1), M(:,1)))
    y = [];
    
    for i = 1:k
      y = [y sqrt(dot(M(:,i), M(:,i)))];
    end
end
