function deltaPheromoneLevels = ComputeDeltaPheromoneLevels(pathCollection, pathLengthCollection)

    [numberOfPaths, numberOfCities] = size(pathCollection);
    deltaPheromoneLevels = zeros(numberOfCities, numberOfCities);
    
    for i = 1:numberOfPaths
        path = pathCollection(i, :);
        pathLength = pathLengthCollection(i);
        currentCity = path(end);
        
        for j = 1:numberOfCities
            nextCity = path(j);
            deltaPheromoneLevels(currentCity, nextCity) = deltaPheromoneLevels(currentCity, nextCity) + (1.0 / pathLength);
            currentCity = nextCity;
        end
    end
    
end