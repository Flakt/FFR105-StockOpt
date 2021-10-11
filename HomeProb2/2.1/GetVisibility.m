function visibility = GetVisibility(cityLocation)
    numberOfCities = length(cityLocation);
    visibility = inf(numberOfCities, numberOfCities);
    
    for i = 1:numberOfCities
        for j = 1 + 1:numberOfCities
            % Get the euclidean distance
            distance = norm(cityLocation(j, :) - cityLocation(i, :));
            n_ij = 1.0 / distance;
            
            visibility(i,j) = n_ij;
            visibility(j,i) = n_ij;
        end
    end
    
end