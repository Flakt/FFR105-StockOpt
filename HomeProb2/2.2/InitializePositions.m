function positions = InitializePositions(numberOfParticles, numberOfDimensions, xMin, xMax)

    positions = zeros(numberOfParticles, numberOfDimensions);
    randInit =  rand(numberOfParticles, numberOfDimensions) * (xMax - xMin);
    
    positions = positions + xMin + randInit;
    
end