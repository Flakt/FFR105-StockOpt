% This method should return the coefficients of the k-th derivative (defined by
% the derivativeOrder) of the polynomial given by the polynomialCoefficients (see also GetPolynomialValue)

function derivativeCoefficients = DifferentiatePolynomial(polynomialCoefficients, derivativeOrder)
    for i = 1:derivativeOrder
        % Only one coefficient
        if length(polynomialCoefficients) < 2
            derivativeCoefficients = [];
            break;
        end
        
        % calculate nk for k * x^n
        newCoefficients = zeros(1, length(polynomialCoefficients) - 1);
        for j = 1:length(newCoefficients)
            newCoefficients(j) = polynomialCoefficients(j + 1) * j;
        end
    
        polynomialCoefficients = newCoefficients;
    end
    derivativeCoefficients = polynomialCoefficients;
end

