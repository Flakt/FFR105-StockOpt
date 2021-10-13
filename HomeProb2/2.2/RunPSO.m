clear all;

numberOfParticles = 30;
numberOfDimensions = 2;
numberOfIterations = 500;
xMin = -5;
xMax = 5;
alpha = 1;
beta = 0.9;
c1 = 2;
c2 = 2;
maxVelocity = xMax - xMin;
minInertiaWeight = 0.35;
maxInertiaWeight = 1.4;

positions = InitializePositions(numberOfParticles, numberOfDimensions, xMin, xMax);
velocities = InitializeVelocities(numberOfParticles, numberOfDimensions, xMin, xMax, alpha);

bestParticlePerformances = inf(numberOfParticles, 1);
bestParticlePositions = zeros(numberOfParticles, numberOfDimensions);

bestOverallPerformance = inf;
bestOverallPosition = zeros(numberOfDimensions, 1);

inertiaWeight = maxInertiaWeight;

for i = 1:numberOfIterations
    for particle = 1:numberOfParticles
        particlePosition = positions(particle, :);
        
        particlePerformance = EvaluatePerformance(particlePosition);
        
        if particlePerformance < bestParticlePerformances(particle)
            bestParticlePerformances(particle) = particlePerformance;
            bestParticlePosition = particlePosition;
            
            if particlePerformance < bestOverallPerformance
                bestOverallPerformance = particlePerformance;
                bestOverallPosition = particlePosition;
                disp(sprintf('Iteration: %d, bestPerformance: %.6f, bestPosition: (%.6f, %.6f)\n',...
                              i, bestOverallPerformance, bestOverallPosition));
            end
        end
    end
    
    velocities = UpdateVelocities(velocities, positions, bestParticlePositions, bestOverallPosition,...
                                  maxVelocity, inertiaWeight, c1, c2);
                              
    positions = positions + velocities;
    inertiaWeight = UpdateInertiaWeight(inertiaWeight, beta, minInertiaWeight);
    
end