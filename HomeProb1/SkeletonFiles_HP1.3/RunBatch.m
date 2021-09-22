%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameter specifications
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

numberOfRuns = 100;                % Do NOT change
populationSize = 100;              % Do NOT change
maximumVariableValue = 5;          % Do NOT change (x_i in [-a,a], where a = maximumVariableValue)
numberOfGenes = 50;                % Do NOT change
numberOfVariables = 2;		   % Do NOT change
numberOfGenerations = 300;         % Do NOT change
tournamentSize = 2;                % Do NOT change
tournamentProbability = 0.75;      % Do NOT change
crossoverProbability = 0.8;        % Do NOT change


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Batch runs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define more runs here (pMut < 0.02) ...
mutationProbability = 0.0;
sprintf('Mutation rate = %0.5f', mutationProbability)
maximumFitnessList000 = zeros(numberOfRuns,1);
for i = 1:numberOfRuns
    [maximumFitness, bestVariableValues] = RunFunctionOptimization(populationSize, numberOfGenes, numberOfVariables, maximumVariableValue, tournamentSize, ...
                                         tournamentProbability, crossoverProbability, mutationProbability, numberOfGenerations);
    sprintf('Run: %d, Score: %0.10f', i, maximumFitness)
     maximumFitnessList000(i,1) = maximumFitness;
end

mutationProbability = 0.01;
sprintf('Mutation rate = %0.5f', mutationProbability)
maximumFitnessList001 = zeros(numberOfRuns,1);
for i = 1:numberOfRuns
    [maximumFitness, bestVariableValues] = RunFunctionOptimization(populationSize, numberOfGenes, numberOfVariables, maximumVariableValue, tournamentSize, ...
                                         tournamentProbability, crossoverProbability, mutationProbability, numberOfGenerations);
    sprintf('Run: %d, Score: %0.10f', i, maximumFitness)
     maximumFitnessList001(i,1) = maximumFitness;
end

mutationProbability = 0.02;
sprintf('Mutation rate = %0.5f', mutationProbability)
maximumFitnessList002 = zeros(numberOfRuns,1);
for i = 1:numberOfRuns 
 [maximumFitness, bestVariableValues]  = RunFunctionOptimization(populationSize, numberOfGenes, numberOfVariables, maximumVariableValue, tournamentSize, ...
                                       tournamentProbability, crossoverProbability, mutationProbability, numberOfGenerations);
 sprintf('Run: %d, Score: %0.10f', i, maximumFitness)
  maximumFitnessList002(i,1) = maximumFitness;
end

% ... and here (pMut > 0.02)

mutationProbability = 0.04;
sprintf('Mutation rate = %0.5f', mutationProbability)
maximumFitnessList004 = zeros(numberOfRuns,1);
for i = 1:numberOfRuns
    [maximumFitness, bestVariableValues] = RunFunctionOptimization(populationSize, numberOfGenes, numberOfVariables, maximumVariableValue, tournamentSize, ...
                                         tournamentProbability, crossoverProbability, mutationProbability, numberOfGenerations);
    sprintf('Run: %d, Score: %0.10f', i, maximumFitness)
     maximumFitnessList004(i,1) = maximumFitness;
end

mutationProbability = 0.08;
sprintf('Mutation rate = %0.5f', mutationProbability)
maximumFitnessList008 = zeros(numberOfRuns,1);
for i = 1:numberOfRuns
    [maximumFitness, bestVariableValues] = RunFunctionOptimization(populationSize, numberOfGenes, numberOfVariables, maximumVariableValue, tournamentSize, ...
                                         tournamentProbability, crossoverProbability, mutationProbability, numberOfGenerations);
    sprintf('Run: %d, Score: %0.10f', i, maximumFitness)
     maximumFitnessList008(i,1) = maximumFitness;
end

mutationProbability = 0.1;
sprintf('Mutation rate = %0.5f', mutationProbability)
maximumFitnessList010 = zeros(numberOfRuns,1);
for i = 1:numberOfRuns
    [maximumFitness, bestVariableValues] = RunFunctionOptimization(populationSize, numberOfGenes, numberOfVariables, maximumVariableValue, tournamentSize, ...
                                         tournamentProbability, crossoverProbability, mutationProbability, numberOfGenerations);
    sprintf('Run: %d, Score: %0.10f', i, maximumFitness)
     maximumFitnessList010(i,1) = maximumFitness;
end

mutationProbability = 0.2;
sprintf('Mutation rate = %0.5f', mutationProbability)
maximumFitnessList020 = zeros(numberOfRuns,1);
for i = 1:numberOfRuns
    [maximumFitness, bestVariableValues] = RunFunctionOptimization(populationSize, numberOfGenes, numberOfVariables, maximumVariableValue, tournamentSize, ...
                                         tournamentProbability, crossoverProbability, mutationProbability, numberOfGenerations);
    sprintf('Run: %d, Score: %0.10f', i, maximumFitness)
     maximumFitnessList020(i,1) = maximumFitness;
end

mutationProbability = 0.5;
sprintf('Mutation rate = %0.5f', mutationProbability)
maximumFitnessList050 = zeros(numberOfRuns,1);
for i = 1:numberOfRuns
    [maximumFitness, bestVariableValues] = RunFunctionOptimization(populationSize, numberOfGenes, numberOfVariables, maximumVariableValue, tournamentSize, ...
                                         tournamentProbability, crossoverProbability, mutationProbability, numberOfGenerations);
    sprintf('Run: %d, Score: %0.10f', i, maximumFitness)
     maximumFitnessList050(i,1) = maximumFitness;
end

mutationProbability = 0.75;
sprintf('Mutation rate = %0.5f', mutationProbability)
maximumFitnessList075 = zeros(numberOfRuns,1);
for i = 1:numberOfRuns
    [maximumFitness, bestVariableValues] = RunFunctionOptimization(populationSize, numberOfGenes, numberOfVariables, maximumVariableValue, tournamentSize, ...
                                         tournamentProbability, crossoverProbability, mutationProbability, numberOfGenerations);
    sprintf('Run: %d, Score: %0.10f', i, maximumFitness)
     maximumFitnessList075(i,1) = maximumFitness;
end

mutationProbability = 1.0;
sprintf('Mutation rate = %0.5f', mutationProbability)
maximumFitnessList100 = zeros(numberOfRuns,1);
for i = 1:numberOfRuns
    [maximumFitness, bestVariableValues] = RunFunctionOptimization(populationSize, numberOfGenes, numberOfVariables, maximumVariableValue, tournamentSize, ...
                                         tournamentProbability, crossoverProbability, mutationProbability, numberOfGenerations);
    sprintf('Run: %d, Score: %0.10f', i, maximumFitness)
     maximumFitnessList100(i,1) = maximumFitness;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Summary of results
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Add more results summaries here (pMut < 0.02) ...
average000 = mean(maximumFitnessList000);
median000 = median(maximumFitnessList000);
std000 = sqrt(var(maximumFitnessList000));
sprintf('PMut = 0.00: Median: %0.10f, Average: %0.10f, STD: %0.10f', median000, average000, std000)

average001 = mean(maximumFitnessList001);
median001 = median(maximumFitnessList001);
std001 = sqrt(var(maximumFitnessList001));
sprintf('PMut = 0.01: Median: %0.10f, Average: %0.10f, STD: %0.10f', median001, average001, std001)

average002 = mean(maximumFitnessList002);
median002 = median(maximumFitnessList002);
std002 = sqrt(var(maximumFitnessList002));
sprintf('PMut = 0.02: Median: %0.10f, Average: %0.10f, STD: %0.10f', median002, average002, std002)

% ... and here (pMut > 0.02)

average004 = mean(maximumFitnessList004);
median004 = median(maximumFitnessList004);
std004 = sqrt(var(maximumFitnessList004));
sprintf('PMut = 0.04: Median: %0.10f, Average: %0.10f, STD: %0.10f', median004, average004, std004)

average008 = mean(maximumFitnessList008);
median008 = median(maximumFitnessList008);
std008 = sqrt(var(maximumFitnessList008));
sprintf('PMut = 0.08: Median: %0.10f, Average: %0.10f, STD: %0.10f', median008, average008, std008)

average010 = mean(maximumFitnessList010);
median010 = median(maximumFitnessList010);
std010 = sqrt(var(maximumFitnessList010));
sprintf('PMut = 0.1: Median: %0.10f, Average: %0.10f, STD: %0.10f', median010, average010, std010)

average020 = mean(maximumFitnessList020);
median020 = median(maximumFitnessList020);
std020 = sqrt(var(maximumFitnessList020));
sprintf('PMut = 0.2: Median: %0.10f, Average: %0.10f, STD: %0.10f', median020, average020, std020)

average050 = mean(maximumFitnessList050);
median050 = median(maximumFitnessList050);
std050 = sqrt(var(maximumFitnessList050));
sprintf('PMut = 0.5: Median: %0.10f, Average: %0.10f, STD: %0.10f', median050, average050, std050)

average075 = mean(maximumFitnessList075);
median075 = median(maximumFitnessList075);
std075 = sqrt(var(maximumFitnessList075));
sprintf('PMut = 0.75: Median: %0.10f, Average: %0.10f, STD: %0.10f', median075, average075, std075)

average100 = mean(maximumFitnessList100);
median100 = median(maximumFitnessList100);
std100 = sqrt(var(maximumFitnessList100));
sprintf('PMut = 1.0: Median: %0.10f, Average: %0.10f, STD: %0.10f', median100, average100, std100)
