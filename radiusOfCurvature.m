function [ radius ] = radiusOfCurvature( theta, a, e )
%radiusOfCurvature Radius of curvature of ellipse

radius = a / sqrt(1 - (e * sin(theta))^2);
end

