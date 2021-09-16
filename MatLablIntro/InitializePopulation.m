function population = InitializePopulation(populationSize, nGenes)

    population = zeros(populationSize, nGenes);
    for i = 1:populationSize
        for j = 1:nGenes
            s = rand;
            if (s < 0.5)
                population(i,j) = 0;
            else
                population(i,j) = 1;
            end
        end
    end
end