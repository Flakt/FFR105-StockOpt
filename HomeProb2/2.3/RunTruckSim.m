function [travelTime, distance, slopeAngles, brakePreassures, gears, velocities, temps, slopePositions] = RunTruckSim(wIH, wHO,...
                                                                                          slopeSet, slopeIndex,...
                                                                                          slopeLength)

     velocity = 20;
     deltaTime = 0.1;
     TempMax = 750;
     M = 20000;
     tau = 30;
     C_h = 40;
     TempAmb = 283;
     C_b = 3000;
     velocityMax = 25;
     velocityMin = 1;
     alphaMax = 10;
     gearChangeCooldown = 2;
     g = 9.81;

     gear = 7;
     TempB = 500;
     deltaTempB = TempB - TempAmb;
     travelTime = 0;
     distance = 0;
     Pp = 0;
     timeWhenGearChange = 0;
        
     gears = [];
     brakePreassures = [];
     slopeAngles = [];
     velocities = [];
     temps = [];
     slopePositions = [];
     
     while distance < slopeLength
         
        slopeAngle = GetSlopeAngle(distance, slopeIndex, slopeSet);
        F_g = M * g * sind(slopeAngle);
        F_b = ComputeF_b(M, g, TempB, TempMax, Pp);
        F_eb = ComputeF_eb(gear, C_b);
        
        acceleration = (F_g - F_b - F_eb) / M;
        
        networkInput = [velocity / velocityMax; slopeAngle / alphaMax; TempB / TempMax;];
        [Pp, newGear] = RunNeuralNetwork(wIH, wHO, networkInput);
        timeBetweenGearChange = travelTime - timeWhenGearChange;
        
        if (timeBetweenGearChange >= gearChangeCooldown) && newGear <= 0.3
            gear = max(gear - 1, 1);
            timeWhenGearChange = travelTime;
        elseif (timeBetweenGearChange >= gearChangeCooldown) && newGear >= 0.7
            gear = min(gear + 1, 10);
            timeWhenGearChange = travelTime;
        end

        newVelocity = velocity + (acceleration * deltaTime);
        
        deltaTempB = ComputeDeltaTempB(Pp, deltaTempB, tau, C_h, deltaTime);
        TempB = TempAmb + deltaTempB;
        slopePositions = [slopePositions distance];
        
        velocity = newVelocity;
        travelTime = travelTime + deltaTime;
        distance = distance + ((velocity + newVelocity) / 2) * deltaTime;
        
        slopeAngles = [slopeAngles slopeAngle];
        gears = [gears gear];
        brakePreassures = [brakePreassures Pp];
        velocities = [velocities velocity];
        temps = [temps TempB];
        
        if velocity < velocityMin || velocity > velocityMax || TempB > TempMax
            break;
        end
  
     end
end