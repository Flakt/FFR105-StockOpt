function deltaVelocities = UpdateVelocities(velocities, positions, bestParticlePositions,...
                           bestOverallPosition, maxVelocity, inertiaWeight, c1, c2)
   
   [numberOfParticles, numberOfDimensions] = size(velocities);                    
   deltaVelocities = zeros(numberOfParticles, numberOfDimensions);
   
   socialComponent = c2 * rand(size(positions)).* (bestOverallPosition - positions);
   cognitiveComponent = c1 * rand(size(positions)).* (bestParticlePositions - positions);
   
   deltaVelocities = inertiaWeight * velocities + cognitiveComponent + socialComponent;
   
   deltaVelocities(velocities > maxVelocity) = maxVelocity;
   deltaVelocities(velocities < -maxVelocity) = -maxVelocity;

end