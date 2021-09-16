function [maximumFitness, bestVariableValues] = RunFunctionOptimization(populationSize, numberOfGenes, numberOfVariables, maximumVariableValue, ...
tournamentSize, tournamentProbability, crossoverProbability, mutationProbability, numberOfGenerations);

 format long

 maximumFitness  = 0;
 population = InitializePopulation(populationSize,numberOfGenes);
 for generation = 1:numberOfGenerations
   maximumFitness  = 0.0;
   fitnessList = zeros(populationSize);
   for i = 1:populationSize
     chromosome = population(i,:);
     variableValues = DecodeChromosome(chromosome,numberOfVariables,maximumVariableValue);
     fitnessList(i) = EvaluateIndividual(variableValues);
     if (fitnessList(i) > maximumFitness ) 
        maximumFitness  = fitnessList(i);
        iBestIndividual = i;
        bestVariableValues = variableValues;
    end
   end
 
   temporaryPopulation = population;  
   for i = 1:2:populationSize
    i1 = TournamentSelect(fitnessList,tournamentProbability,tournamentSize);
    i2 = TournamentSelect(fitnessList,tournamentProbability,tournamentSize);
    r = rand;
    if (r < crossoverProbability) 
     individual1 = population(i1,:);
     individual2 = population(i2,:);
     newIndividualPair = Cross(individual1, individual2);
     temporaryPopulation(i,:) = newIndividualPair(1,:);
     temporaryPopulation(i+1,:) = newIndividualPair(2,:);
    else
     temporaryPopulation(i,:) = population(i1,:);
     temporaryPopulation(i+1,:) = population(i2,:);     
    end
   end
  
   temporaryPopulation(1,:) = population(iBestIndividual,:);
   for i = 2:populationSize
     tempIndividual = Mutate(temporaryPopulation(i,:),mutationProbability);
     temporaryPopulation(i,:) = tempIndividual;
   end
   population = temporaryPopulation;

 end

end