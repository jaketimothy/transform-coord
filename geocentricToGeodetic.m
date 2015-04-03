function [ geodetic ] = geocentricToGeodetic( geocentric, h, a, e )
%geocentricToGeodetic Convert geocentric latitude to geodetic latitude

geodetic = geocentric;
while true
    radius = radiusOfCurvature(geodetic, a, e);
    temp = geodetic;
    geodetic = atan(tan(geocentric) / (1 - e^2 * radius / (radius + h)));
    if (abs(geodetic - temp) < 2 * eps)
        break
    end
end
end

