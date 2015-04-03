function [ r ] = xRotation( phi )
%XROTATION Rotation about the x axis by phi (rad)

s = sin(phi);
c = cos(phi);
r = [1 0 0;
    0 c -s;
    0 s c];
end

