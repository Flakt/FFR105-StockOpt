function velocities = InitializeVelocities(numberOfParticles, numberOfDimensions, xMin, xMax, alpha)

    velocities = zeros(numberOfParticles, numberOfDimensions);
    randInit = rand(numberOfParticles, numberOfDimensions) * (xMax - xMin);
    term = (xMax - xMin) / 2;
    
    velocities = alpha * (velocities + randInit - term);

end