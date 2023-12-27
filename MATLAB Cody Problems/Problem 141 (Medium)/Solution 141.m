function y = solveSudokuRow(x)
    corr_vals = [1 2 3 4 5 6 7 8 9];
    [m, n] = size(x);  % size of initial array
    corr_matrix = reshape(corr_vals, m, n);
    [k, l] = find(x==0); % index of missing digit
    xu =sort(unique(x(x~=0)));
    y1 = [];
    for i = 1:m
        for j = 1:n
            arr = (xu == corr_matrix(i,j));   % Determine if unique array contains all values
            bval = max(arr);
            if ~(bval)
                y1 = [y1 corr_matrix(i,j)];
            else
                continue
            end
        end
    end
    missing_val = y1(1,1);
    x(k,l) = missing_val;
    y = x;  % Final sudoku array
end
