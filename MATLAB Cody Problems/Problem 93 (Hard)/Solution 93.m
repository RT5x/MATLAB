s1 = 'creation'
s2 = 'creations'

l1 = length(s1);
l2 = length(s2);
if l1 == l2  % Case 1: s1 and s2 have same length
    
    if s1 == s2  % Case 2: s1 and s2 are the same string
        d = 0
    else
        array = s1~=s2;
        d = nnz(array)
    end
   
else    % Case 3: s1 and s2 have different lengths
     0;   
    
end
