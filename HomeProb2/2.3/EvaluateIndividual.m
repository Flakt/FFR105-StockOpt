function [fitness, distance, averageVelocity] = EvaluateIndividual(wIH, wHO, slopeset, numberOfSlopes)
    slopeLength = 1000;
    
    fitness = 0;
    distance = 0;
    time = 0;
    
    for i = 1:numberOfSlopes
        [travelTime, simDistance] = RunTruckSim(wIH, wHO, slopeset, i, slopeLength);
        avgVelocityForSlope = simDistance / travelTime;
    
        if simDistance < slopeLength
            delta_fitness = avgVelocityForSlope * simDistance;
        else
            delta_fitness = avgVelocityForSlope * slopeLength;
        end
        
        fitness = fitness + delta_fitness;
        distance = distance + simDistance;
        time = time + travelTime;
    end
    fitness = fitness / numberOfSlopes;
    averageVelocity = distance / time;
end