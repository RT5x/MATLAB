function alt = OrbitAltitude(Period)
%Determine the orbit altitude (km) for a circular orbit of period 'Period' (s)
  alt = 0.001*(((6.6743015e-11)*(5.9722e24)*(Period)^2)/(4*pi^2))^(1/3) - 6371;
end
