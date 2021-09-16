% This function should return the gradient of f_p = f + penalty.
% You may hard-code the gradient required for this specific problem.

function gradF = ComputeGradient(x,mu)
    gradF = [0, 0];
    % Check if mu is 0
    if mu == 0
        gradF(1) = 2 * (x(1) - 1);
        gradF(2) = 4 * (x(2) - 2);
    else
        gradF(1) = 2 * (x(1) - 1) + 4 * x(1) * mu * ((x(1)^2 + x(2)^2 - 1));
        gradF(2) = 4 * (x(2) - 2) + 4 * x(2) * mu * ((x(1)^2 + x(2)^2 - 1));
    end
end


