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
    
    % A possible solution if Statistics and Machine Learning Toolbox is
    % installed
    %
    % node = randsample(1:numberOfCities, 1, true, probE);
    
    % Select index for next city through roulette wheel selection
    % [sortedProbE, sortedIndexes] = sort(probE, 'descend');
    accumalitiveProbE = cumsum(probE);
    % disp(sortedProbE);
    r = rand() * accumalitiveProbE(end);
    candidateIndex = -1;
    for i = 1:length(accumalitiveProbE)
        if (accumalitiveProbE(i) >= r)
            candidateIndex = i;
            break;
        end
    end
    
    % Case where r > all probabilities, select the index with highest
    % probability
    if candidateIndex == -1
        [~, sortedIndexes] = sort(probE, 'descend');
        node = sortedIndexes(1);
    else
        node = candidateIndex;
    end

end