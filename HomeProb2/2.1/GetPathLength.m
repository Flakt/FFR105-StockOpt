function pathLength = GetPathLength(path, cityLocation)
    currentCityIndex = path(end);
    pathLength = 0;
    
    for i = path
        nextCityIndex = path(i);
        distance = norm(cityLocation(nextCityIndex) - cityLocation(currentCityIndex));
        pathLength = pathLength + distance;
        
        currentCityIndex = nextCityIndex;
    end

end