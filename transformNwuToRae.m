function [ rae ] = transformNwuToRae( nwu )
%transformNwuToRae Transforms from the NWU to the RAE frame
%   Transformation of a set of coordinates from the Cartesian x-North,
%   y-West, z-up station fixed frame to the spherical radius, azimuth,
%   elevation angle station fixed frame.  Transforms up to the second
%   derivative, d, given time, t.
%   Nwu is a column vector of size(nwu) = [3*(d + 1), 1] where d = 0:2.
%   Elevation angle is defined as horizon = 0.
%   Azimuth is calculated left-handed from 0 to 2*pi.

rae(1,1) = norm(nwu(1:3));
rae(2,1) = -atan2(nwu(2,1), nwu(1,1));
if (rae(2,1) < 0)
    rae(2,1) = 2 * pi + rae(2,1);
end
rae(3,1) = asin(nwu(3,1) / rae(1,1));
if (size(nwu, 1) == 3)
    return
end

rae(4,1) = (nwu(1:3,1)' * nwu(4:6,1)) / rae(1,1);
rae(5,1) = -(nwu(5,1) * nwu(1,1) - nwu(4,1) * nwu(2,1)) / ...
    sum(nwu(1:2,1).^2);
rae(6,1) = (nwu(6,1) - nwu(3,1) * rae(4,1) / rae(1,1)) / norm(nwu(1:2,1));
if (size(nwu, 1) == 6)
    return
end

rae(7,1) = (sum(nwu(4:6,1).^2) + nwu(1:3,1)' * nwu(7:9) - rae(4,1)^2) / ...
    rae(1,1);
rae(8,1) = -(nwu(8,1) * nwu(1,1) - nwu(2,1) * nwu(7,1) - ...
    2 * rae(5,1) * (nwu(1:2,1)' * nwu(4:5,1))) / sum(nwu(1:2,1).^2);
rae(9,1) = (nwu(9,1) - nwu(3,1) * rae(7,1) / rae(1,1)) / norm(nwu(1:2)) - ...
    rae(8,1) * (nwu(1:2,1)' * nwu(4:5)) / (rae(1,1) * sum(nwu(1:2).^2));
end

