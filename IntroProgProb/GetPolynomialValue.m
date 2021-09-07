% This function should return the value of the polynomial f(x) = a0x^0 + a1x^1 + a2x^2 ...
% where a0, a1, ... are obtained from polynomialCoefficients.

function value = GetPolynomialValue(x, polynomialCoefficients)
    value = 0;
    % Multiply each coeffcient with x to the correct power
    for i = 1:length(polynomialCoefficients)
        coeffWithX = polynomialCoefficients(i) * power(x, i - 1);
        value = value + coeffWithX;
    end
end
