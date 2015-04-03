function [ llh ] = transformEciToLlh( eci, t, a, e, omega )
%transformEciToLlh Transforms from the ECI to the LLH frame
%   Transformation of a set of coordinates from the Cartesian Earth
%   centered inertial frame to the spherical latitude, longitude, altitude
%   frame.  Transforms up to the second derivative, d, given time, t.
%   Latitude and longitude are geodetic.
%   Eci is a column vector of size(eci) = [3*(d + 1), 1] where d = 0:2.
%   T is siderial time in seconds where T = 0 at Greenwich.
%   Omega is the Earth's rotational rate in radians per second.

if (nargin < 5)
    omega = earthRotationRate(); %rad/s
end

ecef = transformEciToEcef(eci, t, omega);
llh = transformEcefToLlh(ecef, a, e);
end

