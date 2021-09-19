% This method should plot the polynomial and the iterates obtained
% using NewtonRaphsonStep (if any iterates were generated).

function PlotIterations(polynomialCoefficients, iterationValues)
    xSpace = linspace(min(iterationValues), max(iterationValues) + 0.5);
    ySpace = GetPolynomialValue(xSpace, polynomialCoefficients);
    
    figure;
    plot(xSpace, ySpace);
    hold on;
    scatter(iterationValues, GetPolynomialValue(iterationValues, polynomialCoefficients), 'blue');
end



