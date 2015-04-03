function [ r ] = yRotation( theta )
%YROTATION Rotation about the y axis by theta (rad)

s = sin(theta);
c = cos(theta);
r = [c 0 s;
    0 1 0;
    -s 0 c];
end

