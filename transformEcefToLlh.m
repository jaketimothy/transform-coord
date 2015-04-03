function [ llhState ] = transformEcefToLlh( ecefState, a, e )
%transformEcefToLlh Transforms from the ECEF to the LLH frame
%   Transformation of a set of coordinates from the Cartesian Earth
%   centered, Earth fixed frame to the spherical latitude, longitude,
%   altitude frame.
%   Latitude and longitude are geodetic.

p = norm(ecefState(1:2,1));
latitude = atan2(ecefState(3,1), p);
while true
    radius = radiusOfCurvature(latitude, a, e);
    L = ecefState(3,1) + e^2 * radius * sin(latitude);
    h = sqrt(L^2 + p^2);
    temp = latitude;
    latitude = atan(ecefState(3,1) / p / (1 - e^2 * radius / (radius + h)));
    if (abs(latitude - temp) < 2 * eps)
        break
    end
end
llhState = [ latitude;
    atan2(ecefState(2,1), ecefState(1,1));
    h ];
if (llhState(2,1) < 0)
    llhState(2,1) = 2 * pi + llhState(2,1);
end
end

