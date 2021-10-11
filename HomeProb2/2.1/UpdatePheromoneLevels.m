function pheromoneLevel = UpdatePheromoneLevels(oldPheromoneLevel, deltaPheromoneLevel, rho)

    [dimX, dimY] = size(oldPheromoneLevel);
    pheromoneLevel = zeros(dimX, dimY);
    for i = 1:dimX
        for j = 1:dimY
            newPheromone = (1 - rho) * oldPheromoneLevel + deltaPheromoneLevel;
            % Minimum as suggested
            if newPheromone < (1.0e-15)
                newPheromone = (1.0e-15);
            end
            pheromoneLevel = newPheromone;
        end
    end
    
end