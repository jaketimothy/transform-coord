function [ ecef ] = transformEciToEcef( eci, t, omega )
%transformEciToEcef Transforms from the ECI to the ECEF frame
%   Transformation of a set of coordinates from the Cartesian Earth
%   centered inertial frame to the Cartesian Earth centered, Earth fixed 
%   frame.  Transforms up to the second derivative, d, given time, t.
%   Eci is a column vector of size(eci) = [3*(d + 1), 1] where d = 0:2.
%   T is siderial time in seconds where T = 0 at Greenwich.
%   Omega is the Earth's rotational rate in radians per second.

if (nargin < 3)
    omega = earthRotationRate();
end

Rz = zRotation(omega * t);
ecef(1:3,1) = Rz * eci(1:3,1);
if (size(eci, 1) == 3)
    return
end

dRz = skew([0 0 omega]) * Rz;
ecef(4:6,1) = dRz * eci(1:3,1) + Rz * eci(4:6,1);
if (size(eci, 1) == 6)
    return
end

ddRz = skew([0 0 omega]) * dRz;
ecef(7:9,1) = ddRz * eci(1:3,1) + 2 .* dRz * eci(4:6,1) + Rz * eci(7:9,1);
end

