function [semi_major, semi_minor, ecc] = orbit_ellipse(apogee, perigee)
    ecc = (apogee - perigee)/(apogee + perigee + 2*(6371));
    semi_major = (perigee+apogee + 2*(6371))/2;
    semi_minor = semi_major * sqrt(1 - ecc^2);
end
