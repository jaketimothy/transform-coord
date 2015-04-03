function [ llr ] = transformEciToLlr( eci, t, omega )
%transformEciToLlr Transforms from the ECI to the LLR frame
%   Transformation of a set of coordinates from the Cartesian Earth
%   centered inertial frame to the spherical latitude, longitude, radius
%   frame.  Transforms up to the second derivative, d, given time, t.
%   Latitude and longitude are geodetic.
%   Eci is a column vector of size(eci) = [3*(d + 1), 1] where d = 0:2.
%   T is siderial time in seconds where T = 0 at Greenwich.
%   Omega is the Earth's rotational rate in radians per second.

if (nargin < 3)
    omega = earthRtationRate(); %rad/s
end

ecef = transformEciToEcef(eci, t, omega);
llr = transformEcefToLlr(ecef);
end

