function [Pp, gearChange] = RunNeuralNetwork(wIH, wHO, networkInput)
    inputToHidden = zeros(size(wIH, 1), 1);
    
    for i = 1:size(wIH, 1)
        sum = wIH(i, 1);
        sum = sum + wIH(i, 2) * networkInput(1);
        sum = sum + wIH(i, 3) * networkInput(2);
        sum = sum + wIH(i, 4) * networkInput(3);
        inputToHidden(i) = 1.0 / (1.0 + exp(-sum));
    end
    
    hiddenToOutput = zeros(size(wHO, 1), 1);
    
    for i = 1:size(wHO, 1)
       sum = wHO(i, 1);
       for j = 2:size(wIH, 1)
           sum = sum + wHO(i, j) * inputToHidden(j);
       end
       hiddenToOutput(i) = 1.0 / (1.0 + exp(-sum));
    end
    Pp = hiddenToOutput(1);
    gearChange = hiddenToOutput(2);

end