function [ geocentric ] = geodeticToGeocentric( geodetic, h, a, e )
%geodeticToGeocentric Convert geodetic latitude to geocentric latitude

radius = radiusOfCurvature(geodetic, a, e);
geocentric = atan((1 - e^2 * radius / (radius + h)) * tan(geodetic));
end

