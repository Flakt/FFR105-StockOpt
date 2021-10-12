function [wIH, wHO] = DecodeChromosome(chromosome, nIn, nHidden, nOut, wMax)

    wIH = zeros(nHidden, (nIn + 1));
    wHO = zeros(nOut, (nHidden + 1));
    
    wIHLength = nHidden * (nIn + 1);
    wHOLength = nOut * (nHidden + 1);
    
    for i = 1:wIHLength
        gene = chromosome(i);
        weight = wMax * gene;
        wIH(i) = weight;
    end
    
    for i = (1 + wIHLength):(wIHLength + wHOLength)
        gene = chromosome(i);
        weight = wMax * gene;
        wHO(i - wIHLength) = weight; 
    end

end
