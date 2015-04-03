function [ ec ] = transformTrjToEc( trj, vehicleState )
%transformTrjToEc Transforms from the trajectory to the ECI or ECEF frame
%   Transformation of a set of coordinates from the Cartesian x-velocity,
%   y-right, z-down vehicle trajectory frame to the Cartesian Earth
%   centered, inertial or Earth centered, Earth fixed frame.  Transforms up
%   to the second derivative, d, given time, t.
%   VehicleState is the vehicle position and velocity in the ECI or ECEF
%   frame.

Rtrj(1:3,1) = vehicleState(4:6,1) ./ norm(vehicleState(4:6,1));
Rtrj(1:3,2) = cross(Rtrj(1:3,1), vehicleState(1:3));
Rtrj(1:3,2) = Rtrj(1:3,2) ./ norm(Rtrj(1:3,2));
Rtrj(1:3,3) = cross(Rtrj(1:3,1), Rtrj(1:3,2));
Rtrj(1:3,3) = Rtrj(1:3,3) ./ norm(Rtrj(1:3,3));

n = size(trj, 1);
ec = zeros(n, 1);
for i = 1:n / 3
    ec(i * 3 - 2:i * 3,1) = Rtrj * trj(i * 3 - 2:i * 3,1);
end
end

