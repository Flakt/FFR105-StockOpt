function mutatedChromosome = Mutate(chromosome, mutationProbability, weightRange)
    
    numberOfGenes = length(chromosome);
    mutatedChromosome = chromosome;

    for i = 1:numberOfGenes
        r1 = rand;
        if r1 < mutationProbability
            r2 = rand;
            minWeight = weightRange(1);
            maxWeight = weightRange(2);
            mutatedChromosome(i) = r2 * abs(maxWeight - minWeight) + minWeight;
        end
    end
end