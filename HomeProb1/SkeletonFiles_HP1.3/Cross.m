function newIndividuals = Cross(individual1, individual2)

    nGenes = size(individual1, 2);

    crossoverPoint = 1 + fix(rand * (nGenes - 1));

    newIndividuals = zeros(2, nGenes);
    for i = 1:nGenes
        if (i <= crossoverPoint)
            newIndividuals(1,i) = individual1(i);
            newIndividuals(2,i) = individual2(i);
        else
            newIndividuals(1,i) =  individual2(i);
            newIndividuals(2,i) = individual1(i);
        end
    end
end
