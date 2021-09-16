% Note: Each component of x should take values in [-a,a], where a = maximumVariableValue.

function x = DecodeChromosome(chromosome,numberOfVariables,maximumVariableValue)
    
    k = length(chromosome) / numberOfVariables;
    
    x(1) = 0.0;
    x(2) = 0.0;
    for i = 1:k
        x(1) = x(1) + chromosome(i) * 2^(-i);
        x(2) = x(2) + chromosome(i + k) * 2^(-i);
    end
    x(1) = x(1) * (2 * maximumVariableValue / (1 - 2^(-k))) - maximumVariableValue;
    x(2) = x(2) * (2 * maximumVariableValue / (1 - 2^(-k))) - maximumVariableValue;
    
end

