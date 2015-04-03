function [ eci ] = transformEcefToEci( ecef, t, omega )
%transformEcefToEci Transforms from the ECEF to the ECI frame
%   Transformation of a set of coordinates from the Cartesian Earth
%   centered, Earth fixed frame to the Cartesian Earth centered inertial 
%   frame.  Transforms up to the second derivative, d, given time, t.
%   Ecef is a column vector of size(ecef) = [3*(d + 1), 1] where d = 0:2.
%   T is siderial time in seconds where T = 0 at Greenwich.
%   Omega is the Earth's rotational rate in radians per second.

if (nargin < 3)
    omega = earthRotationRate(); %rad/s
end

Rz = zRotation(-omega * t);
eci(1:3,1) = Rz * ecef(1:3,1);
if (size(ecef, 1) == 3)
    return
end

dRz = skew([0 0 -omega]) * Rz;
eci(4:6,1) = dRz * ecef(1:3,1) + Rz * ecef(4:6,1);
if (size(ecef, 1) == 6)
    return
end

ddRz = skew([0 0 -omega]) * dRz;
eci(7:9,1) = ddRz * ecef(1:3,1) + 2 .* dRz * ecef(4:6,1) + Rz * ecef(7:9,1);
end

