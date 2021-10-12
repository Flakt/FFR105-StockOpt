clear all;

bestChromosome = [0.40835963634399519 -0.15680180722930714 1.458485371609866 ...
                            4.8726671437208342 -3.464656300531602 2.9129754998370689 ...
                            -0.86644660494941106 2.6925863265830188 -3.8856647009823488 ...
                            1.7365174397022294 -4.3772470452591783 -2.3667174741040089 ...
                            0.272861495860127 -4.8841808827970068 -1.575543067972264 ...
                            0.643421870207801 2.5760597391137807 -1.9219686331479546 ...
                            0.94243922445850892 3.8984692003987789 4.4826926969335261 ...
                            0.93028289174060674 3.109319343632432 2.3946731486606865 ...
                            0.41500062266774851 -4.83477173869826 -4.5568280489817621 ...
                            2.5903294293834396 -4.7405223997267951 -0.25942534065146639 ...
                            3.5293955138729363 -3.3250423790806281];
              
numberOfInputs = 3;
numberOfHidden = 5;
numberOfOutputs = 2;
wMax = 5;
iDataSet = 1;
iSlope = 7;

[wIH, wHO] = DecodeChromosome(bestChromosome, numberOfInputs, numberOfHidden,...
                           numberOfOutputs, wMax);
  
[fitness, distance, averageVelocity, slopeAngles, brakePreassures, gears, velocities, temps, slopePositions] = EvaluateForSingleSlope(wIH,...
                                                                                                wHO, iDataSet, iSlope);
subplot(3, 2, 1);
hold on;
title("Slope Angle");
axis([0 1000 0 10]);
fplot(@(x) GetSlopeAngle(x, iSlope, iDataSet));

subplot(3, 2, 2);
hold on;
title("Brake Pedal Preassure");
axis([0 1000 0 1]);
plot(slopePositions, brakePreassures);

subplot(3, 2, 3);
hold on;
title("Gears");
axis([0 1000 0 10]);
plot(slopePositions, gears);

subplot(3, 2, 4);
hold on;
title("Velocities");
axis([0 1000 0 25]);
plot(slopePositions, velocities);

subplot(3, 2, 5);
hold on;
title("Brake Temperature");
axis([0 1000 0 800]);
plot(slopePositions, temps);