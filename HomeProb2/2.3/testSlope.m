slope = 1;
slopeSet = 3;
angles = zeros(1000, 1);
for i = 1:1000
    slopeAngle = GetSlopeAngle(i, slope, slopeSet);
    angles(i) = slopeAngle;
    
end
disp(angles);