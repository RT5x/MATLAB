function y = damped_cos(lambda, T, N)
    t = linspace(0,T,N);
  y = exp(-lambda .* t) .* cos(2*pi.*t);
end
