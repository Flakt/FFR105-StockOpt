function F_b = ComputeF_b(M, g, Temp_b, Temp_max, Pp)

    if Temp_b < (Temp_max - 100)
        F_b = ((M * g) / 20) * Pp;
    else
        exp_term = -(Temp_b - (Temp_max - 100)) / 100;
        F_b = (((M * g) / 20) * Pp) * exp(exp_term);
    end

end