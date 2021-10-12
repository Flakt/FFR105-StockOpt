function [fitness, distance, averageVelocity, slopeAngles, brakePreassures, gears, velocities, temps, slopePositions] = EvaluateForSingleSlope(wIH, ...
   wHO, iDataSet, iSlope)
    
    slopeLength = 1000;
    [travelTime, distance, slopeAngles, brakePreassures, gears, velocities, temps, slopePositions] = RunTruckSim(wIH, wHO, iDataSet,... 
                                                                                                 iSlope, slopeLength);
    averageVelocity = distance / travelTime;
    
    if distance < slopeLength
        fitness = averageVelocity * distance;
    else
        fitness = averageVelocity * slopeLength;
    end

end