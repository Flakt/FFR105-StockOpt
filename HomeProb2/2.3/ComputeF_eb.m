function F_eb = ComputeF_eb(gear, C_b)

    switch gear
        case 1
            F_eb = 7 * C_b;
        case 2
            F_eb = 5 * C_b; 
        case 3
            F_eb = 4 * C_b;
        case 4
            F_eb = 3 * C_b;
        case 5
            F_eb = 2.5 * C_b;
        case 6
            F_eb = 2 * C_b;     
        case 7
            F_eb = 1.6 * C_b;
        case 8
            F_eb = 1.4 * C_b;
        case 9
            F_eb = 1.2 * C_b;          
        otherwise
            F_eb = C_b;
       
    end
       
end