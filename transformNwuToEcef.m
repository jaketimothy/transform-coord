function [ ecef ] = transformNwuToEcef( nwu, llhs, a, e )
%transformNwuToEcef Transforms from the NWU to the ECEF frame
%   Transformation of a set of coordinates from the Cartesian x-North,
%   y-West, z-up surface fixed frame to the Cartesian Earth centered, Earth
%   fixed frame.  Transforms up to the second derivative, d, given time, t.
%   Llhs is the geodetic station coordinates, latitude and longitude are in
%   radians.

latitude = geodeticToGeocentric(llhs(1), llhs(3), a, e);
Rnf = zRotation(-llhs(2) - pi) * yRotation(pi / 2 - latitude);

n = size(nwu, 1);
ecef = zeros(n, 1);
for i = 1:n / 3
    ecef(i * 3 - 2:i * 3,1) = Rnf * nwu(i * 3 - 2:i * 3,1);
end
end

