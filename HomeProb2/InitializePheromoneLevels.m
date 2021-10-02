function pheromoneLevel = InitializePheromoneLevels(numberOfCities, tau0)

    pheromoneLevel = zeros(numberOfCities, numberOfCities);
    
    for i = 1:numberOfCities
        for j = 1:numberOfCities
            if i == j
                % Don't init pheromone on tau_ii
                continue;   
            end
            pheromoneLevel(i,j) = tau0;
        end
    end
end