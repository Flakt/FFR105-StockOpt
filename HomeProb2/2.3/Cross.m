function newChromosomes = Cross(chromosome1, chromosome2)
    
    numberOfGenes = length(chromosome1);
    
    crossoverPoint = 1 + fix(rand * (numberOfGenes - 1));

    newChromosomes = zeros(2, numberOfGenes);
    for i = 1:numberOfGenes
        if i <= crossoverPoint
            newChromosomes(1, i) = chromosome1(i);
            newChromosomes(2, i) = chromosome2(i);
        else
            newChromosomes(1, i) = chromosome2(i);
            newChromosomes(2, i) = chromosome1(i);
        end
    end
end 