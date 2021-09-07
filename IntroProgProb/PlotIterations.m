% This method should plot the polynomial and the iterates obtained
% using NewtonRaphsonStep (if any iterates were generated).

function PlotIterations(polynomialCoefficients, iterationValues)
    xSpace = linspace(min(iterationValues), max(iterationValues));
    ySpace = GetPolynomialValue(xSpace, polynomialCoefficients);
    
    plot(xSpace, ySpace);
    hold on;
    scatter(iterationValues, GetPolynomialValue(iterationValues, polynomialCoefficients), 'blue');
    hold on;
    plot(iterationValues, GetPolynomialValue(iterationValues, polynomialCoefficients));
end



