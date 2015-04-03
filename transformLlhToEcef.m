function [ ecef ] = transformLlhToEcef( llh, a, e )
%transformLlhToEcef Transforms from the LLH to the ECEF frame
%   Transformation of a set of coordinates from the spherical latitude,
%   longitude, altitude frame to the Cartesian Earth centered, Earth fixed
%   frame.
%   Latitude and longitude are geodetic.

radius = radiusOfCurvature(llh(1), a, e);
ecef = [(radius + llh(3)) * cos(llh(1)) * cos(llh(2));
    (radius + llh(3)) * cos(llh(1)) * sin(llh(2));
    ((1 - e^2) * radius + llh(3)) * sin(llh(1)) ];
end

