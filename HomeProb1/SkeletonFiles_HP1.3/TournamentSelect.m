function selectedIndividualIndex = TournamentSelect(fitnessList, tournamentProbability, tournamentSize)
    populationSize = size(fitnessList, 2);
    selectedForTournamentIndexes = fix(rand(1, tournamentSize)*(populationSize - 1) + 1);

    fitnessTournament = zeros(1, tournamentSize);

    for i = 1:tournamentSize
        fitnessTournament(i) = fitnessList(selectedForTournamentIndexes(i));
    end
    
    [~, sortedTournamentIndexes] = sort(fitnessTournament, 'descend');
    
    % Default worst individual
    selectedIndividualIndex = sortedTournamentIndexes(end);

    r = rand;
    for i = 1:tournamentSize
        if r < tournamentProbability
            selectedIndividualIndex = sortedTournamentIndexes(i);
        end
    end
end
