function [ trj ] = transformBodyToTrj( body, phi )
%transformBodyToTrj Transforms from the body to the trajectory frame
%   Transformation of a set of coordinates from the Cartesian body frame to
%   the Cartesian x-velocity, y-right, z-down vehicle trajectory frame.
%   Transforms up to the second derivative, d, given time, t.
%   Body is a column vector of size(body) = [3*(d + 1), 1] where d = 0:2.
%   Phi is the roll angle.

Rx = xRotation(-phi);

n = size(body, 1);
trj = zeros(n, 1);
for i = 1:n / 3
    trj(i * 3 - 2:i * 3,1) = Rx * body(i * 3 - 2:i * 3,1);
end
end

