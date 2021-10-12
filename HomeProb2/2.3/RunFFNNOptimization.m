clear all;

populationSize = 100;
numberOfInputs = 3;
numberOfHidden = 5;
numberOfOutputs = 2;
chromosomeLength = ((numberOfInputs + 1) * numberOfHidden) + ((numberOfHidden + 1) * numberOfOutputs);
wMax = 5;
trainingSet = 1;
trainingSlopes = 10;
validationSet = 2;
validationSlopes = 5;
testSet = 3;
testSlopes = 5;
initialWeightRange = [-1, 1];
weightRange = [-5, 5];
         
population = InitializePopulation(populationSize, chromosomeLength, initialWeightRange);
fitnessList = zeros(populationSize, 1);
   
bestTrainingChromosome = zeros(1, chromosomeLength);
bestValidationChromosome = zeros(1, chromosomeLength);
bestTrainingFitness = 0;
bestValidationFitness = 0;
 
tournamentSize = 2;
tournamentProbability = 0.9;
crossoverProbability = 0.25;

mutationProbability = 1 / chromosomeLength;

maxIteration = 200;
   
for iteration = 1:maxIteration
    % Evaluation
    for i = 1:populationSize
          
       chromosome = population(i, :);
       [wIH, wHO] = DecodeChromosome(chromosome, numberOfInputs, numberOfHidden, numberOfOutputs, wMax);
       
       [trainingFitness, trainingDistance, trainingAverageVelocity] = EvaluateIndividual(wIH, wHO, trainingSet,...
                                                                                         trainingSlopes);
       fitnessList(i) = trainingFitness;
         
       if bestTrainingFitness < trainingFitness
           bestTrainingFitness = trainingFitness;
           bestTrainingChromosome = chromosome;
              
           disp(sprintf("Generation %d: trainingFitness: %.5f, total distance: %.5f, averageVelocity: %.5f", iteration,...
                    trainingFitness, trainingDistance, trainingAverageVelocity));
                  
           [validationFitness, validationDistance, validationAverageVelocity] = EvaluateIndividual(wIH, wHO,...
                                                                                                   validationSet,...
                                                                                                   validationSlopes);
              
           if bestValidationFitness < validationFitness
               bestValidationFitness = validationFitness;
               bestValidationChromosome = chromosome;
               disp(sprintf("Generation %d: validationFitness: %.5f, total distance: %.5f, averageVelocity: %.5f", iteration,...
                        validationFitness, validationDistance, validationAverageVelocity));
           end
       end 
    end
    
    % Selection & Crossover
    temporaryPopulation = population;
    for i = 1:2:populationSize
        % Selection
        i1 = TournamentSelect(fitnessList, tournamentProbability, tournamentSize);
        i2 = TournamentSelect(fitnessList, tournamentProbability, tournamentSize);
        r = rand;
        
        % Crossover
        chromosome1 = population(i1, :);
        chromosome2 = population(i2, :);
        if r < crossoverProbability
            newChromosomePair = Cross(chromosome1, chromosome2);
            temporaryPopulation(i, :) = newChromosomePair(1, :);
            temporaryPopulation(i + 1, :) = newChromosomePair(2, :);
        else
            temporaryPopulation(i, :) = chromosome2;
            temporaryPopulation(i + 1, :) = chromosome1;
        end
    end
    
    % Mutation
    for i = 1:populationSize
        chromosome = temporaryPopulation(i, :);
        mutatedChromosome = Mutate(chromosome, mutationProbability, weightRange);
        temporaryPopulation(i, :) = mutatedChromosome;
    end
    population = temporaryPopulation;
    iteration = iteration + 1;
       
end

[bestWIH, bestWHO] = DecodeChromosome(bestValidationChromosome, numberOfInputs, numberOfHidden, numberOfOutputs, wMax);
[fitness, distance, averageVelocity] = EvaluateIndividual(bestWIH, bestWHO, testSet, testSlopes);
disp(sprintf("Best network results: Fitness: %.5f, total distance: %.5f, averageVelocity: %.5f", fitness, distance, ...
         averageVelocity));