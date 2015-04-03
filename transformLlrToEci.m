function [ eci ] = transformLlrToEci( llr, t, omega )
%transformLlrToEci Transforms from the LLR to the ECI frame
%   Transformation of a set of coordinates from the spherical latitude,
%   longitude, radius frame to the Cartesian Earth centered inertial frame.
%   Transforms up to the second derivative, d, given time, t.
%   Latitude and longitude are geodetic.
%   T is siderial time in seconds where T = 0 at Greenwich.
%   Omega is the Earth's rotational rate in radians per second.

if (nargin < 3)
    omega = earthRotationRate();
end

ecef = transformLlrToEcef(llr);
eci = transformEcefToEci(ecef, t, omega);
end

