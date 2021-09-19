% First compute the function value, then compute the fitness
% value; see also the problem formulation.

function fitness = EvaluateIndividual(x)
    x_1 = x(1);
    x_2 = x(2);

    firstTerm = (1.5 - x_1 + (x_1 * x_2)).^2;
    secondTerm = (2.25 - x_1 + (x_1 * x_2).^2).^2;
    thirdTerm = (2.625 - x_1 + (x_1 * x_2).^3).^2;

    g_x = firstTerm + secondTerm + thirdTerm;

    fitness = 1 / g_x;

end
