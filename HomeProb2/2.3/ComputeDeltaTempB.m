function deltaTempB = ComputeDeltaTempB(Pp, oldDeltaTempB, tau, C_h, deltaTime)
    
    if Pp < 0.01
        deltaDerivative = -(oldDeltaTempB) / tau;
    else
        deltaDerivative = C_h * Pp;
    end
    
    deltaTempB = oldDeltaTempB + deltaDerivative * deltaTime;
end