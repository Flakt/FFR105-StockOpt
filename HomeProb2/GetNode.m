function node = GetNode(currentCityIndex, tabuList, pheromoneLevel, visibility, alpha, beta)

    numberOfCities = length(tabuList);
    probabilities = zeros(1, numberOfCities);
    % Calculate all numerators
    for i = 1:numberOfCities
        if tabuList(i) == 1
            continue;
        end
        % disp(size(pheromoneLevel));
        term1 = pheromoneLevel(currentCityIndex, i).^alpha;
        term2 = visibility(currentCityIndex, i).^beta;
        probabilities(i) = term1 * term2;
    end
    
    % Calculate denominator
    sum_denom = sum(probabilities);
    probE = zeros(1, length(probabilities));
    
    % Calculate probability pE_ij
    for i = 1:length(probabilities)
        probE(i) = probabilities(i) / sum_denom;
    end
    
    % Select index for next city, higher probability should get picked
    [sortedProbE, sortedIndexes] = sort(probE, 'descend');
    sortedProbE = cumsum(sortedProbE);
    r = rand;
    candidateIndexes = [];
    for i = 1:length(sortedProbE)
        if (sortedProbE(i) >= r)
            candidateIndexes = [candidateIndexes sortedIndexes(i)];
        end
    end
    
    % For cases where r is bigger than all probs in probE, select highest
    % as default
    %if isempty(candidateIndexes)
    %    node = sortedIndexes(1);
    %else  
    %    node = candidateIndexes(1);
    %end

    node = sortedIndexes(1);
end