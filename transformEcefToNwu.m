function [ nwu ] = transformEcefToNwu( ecef, llhs, a, e )
%transformEcefToNwu Transforms from the ECEF to the NWU frame
%   Transformation of a set of coordinates from the Cartesian Earth
%   centered, Earth fixed frame to the Cartesian x-North, y-West, z-up
%   surface fixed frame.  Transforms up to the second derivative, d, given
%   time, t.
%   Ecef is a column vector of size(ecef) = [3*(d + 1), 1] where d = 0:2.
%   Llhs is the geodetic station coordinates, latitude and longitude are in
%   radians.

n = size(ecef, 1);
nwu = zeros(n, 1);
latitude = geodeticToGeocentric(llhs(1,1), llhs(3,1), a, e);
Rf2n = yRotation(latitude - pi / 2) * zRotation(llhs(2,1) + pi);
for i = 1:n / 3
    nwu(i * 3 - 2:i * 3,1) = Rf2n * ecef(i * 3 - 2:i * 3,1);
end
end

