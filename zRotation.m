function [ r ] = zRotation( psi )
%ZROTATION Rotation about the z axis by psi (rad)

s = sin(psi);
c = cos(psi);
r = [c -s 0;
    s c 0;
    0 0 1];
end

