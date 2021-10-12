function selectedIndex = TournamentSelect(fitnessList, tournamentProbability, tournamentSize)
    populationSize = length(fitnessList);
    selectedForTournamentIndexes = fix(rand(1, tournamentSize)*(populationSize - 1) + 1);

    fitnessTournament = zeros(1, tournamentSize);

    for i = 1:tournamentSize
        fitnessTournament(i) = fitnessList(selectedForTournamentIndexes(i));
    end
    
    [~, sortedTournamentIndexes] = sort(fitnessTournament, 'descend');
    
    selected = false;

    for i = 1:tournamentSize
        r = rand;
        if r < tournamentProbability
            selectedIndex = sortedTournamentIndexes(i);
            selected = true;
            break;
        end
    end
    
    if selected == false
        selectedIndex = sortedTournamentIndexes(end);
    end
end