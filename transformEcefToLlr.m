function [ llr ] = transformEcefToLlr( ecef )
%transformEcefToLlr Transforms from the ECEF to the LLR frame
%   Transformation of a set of coordinates from the Cartesian Earth
%   centered, Earth fixed frame to the spherical latitude, longitude,
%   radius frame.  Latitude and longitude are geodetic.

llr = [ atan2(ecef(3,1), norm(ecef(1:2,1)));
    atan2(ecef(2,1), ecef(1,1));
    norm(ecef(1:3,1)) ];
end

