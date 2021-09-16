% This function should run gradient descent until the L2 norm of the
% gradient falls below the specified threshold.

function x = RunGradientDescent(xStart, mu, eta, gradientTolerance)
    l2Norm = 1000;
    currentX = xStart;
    while l2Norm > gradientTolerance
        grad = ComputeGradient(currentX, mu);
        nextX = currentX - (eta * grad);
        % Calculate the l2Norm
        l2Norm = sqrt(grad(1)^2 + grad(2)^2);
        % Update variables for next iteration
        currentX = nextX;
    end
    % Reached a point where l2Norm <= gradientTolerance
    x = currentX;
end

