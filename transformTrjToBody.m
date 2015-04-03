function [ body ] = transformTrjToBody( trj, phi )
%transformTrjToBody Transforms from the trajectory to the body frame
%   Transformation of a set of coordinates from the Cartesian trajectory
%   frame to the Cartesian x-velocity, y-right, z-down vehicle trajectory
%   frame. Transforms up to the second derivative, d, given time, t.
%   Trj is a column vector of size(trj) = [3*(d + 1), 1] where d = 0:2.
%   Phi is the roll angle.

Rx = xRotation(phi);

n = size(trj, 1);
body = zeros(n, 1);
for i = 1:n / 3
    body(i * 3 - 2:i * 3,1) = Rx * trj(i * 3 - 2:i * 3,1);
end
end

