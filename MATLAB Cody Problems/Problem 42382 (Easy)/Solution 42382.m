function y = combined_ages(AB,BC,AC)
    b = [AB;BC;AC];
    a = [1 1 0; 0 1 1; 1 0 1];
    y = (a\b)'
end
