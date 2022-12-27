function x = solve_lin(theta)
      b = [1;1];
      A = [cos(theta) sin(theta); -sin(theta) cos(theta)]
    x = A\b; 
end
