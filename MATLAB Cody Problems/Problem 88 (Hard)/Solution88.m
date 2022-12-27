function sOut = scrambleText(sIn)

sChar = char(sIn);  % Convert to char array
rf = isstrprop(sChar,'wspace') + isstrprop(sChar,'alpha');
non= nnz(~rf);
[idx] = find(rf==0);  % Index of the problem child

sChar(idx) = []

newStr = split(sChar);
n1 = numel(newStr);
n = strlength(sIn);
%charArray = num2cell(char(newStr));
[m,k] = size(newStr);
vec = [];



for i = 1:m

    z = strlength(newStr(i,1));
    charArray = num2cell(char(newStr(i,1)));
   
        charArray(2:z-1) = charArray(z-1:-1:2);
         a=string(charArray);
        c = strjoin(a,'');
        vec=[vec c];
end


        
sOut1 = strjoin(vec,' ')
if non ~= 0
    sOut = sOut1 + "."
    
else
    sOut = sOut1
    
end

end
