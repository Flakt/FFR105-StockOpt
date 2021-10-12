function population = InitializePopulation(populationSize, chromosomeLength, initialWeightRange)

    minWeight = initialWeightRange(1);
    maxWeight = initialWeightRange(2);
    population = zeros(populationSize, chromosomeLength);
    for i = 1:populationSize
        population(i, :) = minWeight + rand(1, chromosomeLength)*(maxWeight - minWeight);
    end
end