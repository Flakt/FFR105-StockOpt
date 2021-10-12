function chromosome = EncodeNetwork(wIH, wHO, wMax)
    % Chromosome = wIHGenes and then wHOGenes 
    sizewIHGenes = size(wIH, 1) * size(wIH, 2);
    disp(sizewIHGenes);
    sizewHOGenes = size(wHO, 1) * size(wHO, 2);
    disp(sizewHOGenes);
    
    wIHGenes = zeros(1, sizewIHGenes);
    wHOGenes = zeros(1, sizewHOGenes);
    
    for i = 1:sizewIHGenes
        weight = wIH(i);
        gene = weight / wMax;
        wIHGenes(i) = gene;
    end
    
    for i = 1:sizewHOGenes
        weight = wHO(i);
        gene = weight / wMax;
        wHOGenes(i) = gene;
    end
    
    chromosome = [wIHGenes wHOGenes];
end