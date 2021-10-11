function performance = EvaluatePerformance(particlePosition)
    x = particlePosition(1);
    y = particlePosition(2);
    
    performance = (x.^2 + y - 11).^2 + (x + y.^2 - 7).^2;
end