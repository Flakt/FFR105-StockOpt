clear all;

populationSize = 30;
numberOfGenes = 40;
crossoverProbability = 0.8;
mutationProbability = 0.025;
tournamentSelectionParameter = 0.75;
variableRange = 3.0;
numberOfGenerations = 100;
fitness = zeros(populationSize, 1);

fitnessFigureHandle = figure;
hold on;
set(fitnessFigureHandle, 'Position', [50, 50, 500, 200]);
set(fitnessFigureHandle, 'DoubleBuffer', 'on')
axis([1 numberOfGenerations 2.5 3]);
bestPlotHandle = plot(1:numberOfGenerations, zeros(1, numberOfGenerations));
textHandle = text(30, 2.5, sprintf('best: %4.3f', 0.0));
hold off;
drawnow;

population = InitializePopulation(populationSize, numberOfGenes);

for iGeneration = 1:numberOfGenerations
    
    maximumFitness = 0.0;
    xBest = zeros(1,2);
    bestIndividualIndex = 0;
    for i = 1:populationSize
        chromosome = population(i,:);
        x = DecodeChromosome(chromosome, variableRange);
        fitness(i) = EvaluateIndividual(x);
        if fitness(i) > maximumFitness
            maximumFitness = fitness(i);
            bestIndividualIndex = i;
            xBest = x;
        end
    end
    
    disp('xBest');
    disp(xBest);
    disp('maximumFitness');
    disp(maximumFitness);

    tempPopulation = population;

    for i = 1:2:populationSize
        i1 = TournamentSelect(fitness, tournamentSelectionParameter);
        i2 = TournamentSelect(fitness, tournamentSelectionParameter);
        chromosome1 = population(i1,:);
        chromosome2 = population(i2,:);
    
        r = rand;
        if (r < crossoverProbability)
            newChromosomePair = Cross(chromosome1, chromosome2);
            tempPopulation(i,:) = newChromosomePair(1,:);
            tempPopulation(i + 1,:) = newChromosomePair(2,:);
        else
            tempPopulation(i,:) = chromosome1;
            tempPopulation(i + 1,:) = chromosome2;
        end
    end

    for i = 1:populationSize
        originalChromosome = tempPopulation(i,:);
        mutatedChromosome = Mutate(originalChromosome, mutationProbability);
        tempPopulation(i,:) = mutatedChromosome;
    end
    
    tempPopulation(1,:) = population(bestIndividualIndex,:);
    population = tempPopulation;
    
    plotvector = get(bestPlotHandle, 'YData');
    plotvector(iGeneration) = maximumFitness;
    set(bestPlotHandle, 'YData', plotvector);
    set(textHandle, 'String', sprintf('best: %4.3f',maximumFitness));
end

disp('xBest');
disp(xBest);
disp('maximumFitness');
disp(maximumFitness);
