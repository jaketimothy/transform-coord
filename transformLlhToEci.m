function [ eci ] = transformLlhToEci( llh, t, a, e, omega )
%transformLlhToEci Transforms from the LLH to the ECI frame
%   Transformation of a set of coordinates from the spherical latitude,
%   longitude, altitude frame to the Cartesian Earth centered inertial
%   frame.  Transforms up to the second derivative, d, given time, t.
%   Latitude and longitude are geodetic.
%   T is siderial time in seconds where T = 0 at Greenwich.
%   Omega is the Earth's rotational rate in radians per second.

if (nargin < 5)
    omega = earthRotationRate; %rad/s
end

ecef = transformLlhToEcef(llh, a, e);
eci = transformEcefToEci(ecef, t, omega);
end

