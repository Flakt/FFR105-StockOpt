function newVelocities = UpdateVelocities(velocities, positions, bestParticlePositions,...
                           bestOverallPosition, maxVelocity, inertiaWeight, c1, c2)
   
   [numberOfParticles, numberOfDimensions] = size(velocities);
   newVelocities = zeros(numberOfParticles, numberOfDimensions);
   r = rand;
   q = rand;
   
   for i = 1:numberOfParticles
       cognitiveComponent = c1 * q .* (bestParticlePositions(i, :) - positions(i, :));
       socialComponent = c2 * r .* (bestOverallPosition - positions(i, :));
       newVelocity = (inertiaWeight * velocities(i, :)) + cognitiveComponent + socialComponent;
           
       if newVelocity(1) < -maxVelocity
           newVelocity(1) = -maxVelocity;
       elseif newVelocity(1) > maxVelocity
           newVelocity(1) = maxVelocity;
       end
           
       if newVelocity(2) < -maxVelocity
           newVelocity(2) = -maxVelocity;
       elseif newVelocity(2) > maxVelocity
           newVelocity(2) = maxVelocity;
       end
           
       newVelocities(i, :) = newVelocity;
      
   end
    
end