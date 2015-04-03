function [ trj ] = transformEcefToTrj( ecef, vehicleState )
%transformEcefToTrj Transforms from the ECEF to the trajectory frame
%   Transformation of a set of coordinates from the Cartesian Earth
%   centered, Earth fixed frame to the Cartesian x-velocity, y-right,
%   z-down vehicle trajectory frame.  Transforms up to the second
%   derivative, d, given time, t.
%   Ecef is a column vector of size(ecef) = [3*(d + 1), 1] where d = 0:2.
%   VehicleState is the vehicle position and velocity in the ECEF frame.

Rtrj(:,1) = vehicleState(4:6,1) ./ norm(vehicleState(4:6,1));
Rtrj(:,2) = cross(vehicleState(4:6,1), vehicleState(1:3,1));
Rtrj(:,2) = Rtrj(:,2) ./ norm(Rtrj(:,2));
Rtrj(:,3) = cross(vehicleState(4:6,1), Rtrj(:,2));
Rtrj(:,3) = Rtrj(:,3) ./ norm(Rtrj(:,3));
Rtrj = Rtrj';

n = size(ecef, 1);
trj = zeros(n, 1);
for i = 1:n / 3
    trj(i * 3 - 2:i * 3,1) = Rtrj * ecef(i * 3 - 2:i * 3,1);
end
end

