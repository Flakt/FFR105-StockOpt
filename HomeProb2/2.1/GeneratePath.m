function path = GeneratePath(pheromoneLevel, visibility, alpha, beta)
    numberOfCities = length(pheromoneLevel);
    path = zeros(1, numberOfCities);
    tabuList = zeros(1, numberOfCities);
    
    startingCityIndex = fix(rand()*50) + 1;
    path(1) = startingCityIndex;
    tabuList(startingCityIndex) = 1;
    
    currentCityIndex = startingCityIndex;
    for i = 2:numberOfCities
        nextCityIndex = GetNode(currentCityIndex, tabuList, pheromoneLevel, visibility, alpha, beta);
        path(i) = nextCityIndex;
        tabuList(nextCityIndex) = 1;
        currentCityIndex = nextCityIndex;
    end
end