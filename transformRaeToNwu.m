function [ nwu ] = transformRaeToNwu( rae )
%transformRaeToNwu Transforms from the RAE to the NWU frame
%   Transformation of a set of coordinates from the spherical radius,
%   azimuth, elevation angle station fixed frame to the Cartesian x-North,
%   y-West, z-up station fixed frame.  Transforms up to the second
%   derivative, d, given time, t.
%   Rae is a column vector of size(nwu) = [3*(d + 1), 1] where d = 0:2.
%   Elevation angle is defined as horizon = 0.
%   Azimuth is calculated left-handed from 0 to 2*pi.

nwu = [rae(1,1) * cos(rae(3,1)) * cos(rae(2,1));
    -rae(1,1) * cos(rae(3,1)) * sin(rae(2,1));
    rae(1,1) * sin(rae(3,1))];
end

