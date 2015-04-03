function [ ecef ] = transformLlrToEcef( llr )
%transformLlrToEcef Transforms from the LLR to the ECEF frame
%   Transformation of a set of coordinates from the spherical latitude,
%   longitude, radius frame to the Cartesian Earth centered, Earth fixed
%   frame.
%   Latitude and longitude are geodetic.

ecef = [llr(3) * cos(llr(1)) * cos(llr(2));
    llr(3) * cos(llr(1)) * sin(llr(2));
    llr(3) * sin(llr(1)) ];
end

