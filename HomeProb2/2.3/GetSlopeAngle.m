function alpha = GetSlopeAngle(x, iSlope, iDataSet)
    if iDataSet == 1                              % Training
        if iSlope == 1
            alpha = 4 + sin(x/100) + cos(sqrt(2) * x/50);
        elseif iSlope == 2
            alpha = 5 + 2 * sin(x/150) + cos(x/100);
        elseif iSlope == 3
            alpha = 3 + sin(x/150) + sqrt(2) * cos(x/50);
        elseif iSlope == 4
            alpha = 5 + 3 * sin(x/100) - cos(x/150);
        elseif iSlope == 5
            alpha = 0 + 4 * sin(x/500) + cos(x/70);
        elseif iSlope == 6
            alpha = 3 + sin(x/50) - 2 * cos(sqrt(2) * x/100);
        elseif iSlope == 7
            alpha = 1 + sin(x/50) + 4 * cos(sqrt(2) * x/1000);
        elseif iSlope == 8
            alpha = 3 - 2 * sin(x/50) + cos(sqrt(3) * x/100);
        elseif iSlope == 9
            alpha = 3 - sqrt(2) * sin(x/250) - cos(x/50);
        elseif iSlope == 10
            alpha = 3 + 2 * sin(x/50) + cos(sqrt(2) * x/100);
        end
    elseif iDataSet == 2                            % Validation
        if iSlope == 1 
            alpha = 5 - 3 * sin(x/50) + cos(x/100);
        elseif iSlope == 2
            alpha = 6 - sin(x/100) + cos(sqrt(3) * x/50);
        elseif iSlope== 3
            alpha = 3 + sin(sqrt(2) * x/50) + cos(sqrt(2) * x/50);
        elseif iSlope== 4
            alpha = 7 - 2 * sin(x/150) - cos(x/100);
        elseif iSlope == 5
            alpha = 5 + sin(x/50) + cos(sqrt(5) * x/50);
        end 
    elseif iDataSet == 3                           % Test
        if iSlope == 1 
            alpha = 6 - sin(x/100) - cos(sqrt(7) * x/50);
        elseif iSlope == 2
            alpha = 2 + sin(x/70) + 2 * cos(x/100);
        elseif iSlope == 3
            alpha = 2 - sin(sqrt(2) * x/100) + 2 * cos(x/120);
        elseif iSlope == 4
            alpha = 4 + 3 * sin(x/70) + cos(x/30);
        elseif iSlope == 5
            alpha = 4 + (x/1000) + sin(x/70) + cos(sqrt(7) * x/100);
        end
    end
end
