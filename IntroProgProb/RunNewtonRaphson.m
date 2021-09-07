% This function should run the Newton-Raphson method, making use of the
% other relevant functions (StepNewtonRaphson, DifferentiatePolynomial, and
% GetPolynomialValue). Before returning iterationValues any non-plottable values 
% (e.g. NaN) that can occur if the method fails (e.g. if the input is a
% first-order polynomial) should be removed, so that only values that
% CAN be plotted are returned. Thus, in some cases (again, the case of
% a first-order polynomial is an example) there may be no points to plot.

function iterationValues = RunNewtonRaphson(polynomialCoefficients, startingPoint, tolerance)
    % Check polynomial
    if length(polynomialCoefficients) < 3
        fprintf('Error: polynomial must be 2 or larger')
        exit;
    end
    
    % Init some variables
    x = Inf;
    nextPoint = startingPoint;
    iterationValues = [];
    
    while abs(nextPoint - x) > tolerance
        iterationValues(end + 1) = x;
        x = nextPoint;
        fPrime = GetPolynomialValue(x, DifferentiatePolynomial(polynomialCoefficients, 1));
        fDoublePrime = GetPolynomialValue(x, DifferentiatePolynomial(polynomialCoefficients, 2));
        
        % Check for division by zero
        if fDoublePrime == 0
            fprintf('Error: second order derivative is 0')
            exit;
        end
        
        nextPoint = StepNewtonRaphson(x, fPrime, fDoublePrime);
        
    end
end
