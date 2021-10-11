range = [0 20 0 20];

bestPath = [49 30 36 46 28 48 33 38 45 27 39 44 40 37 42 34 47 29 ...
                 20 8 16 21 19 7 14 22 17 24 2 12 15 6 3 11 13 10 9 23 ...
                 4 1 5 18 26 25 32 50 41 35 43 31];
cityLocation = LoadCityLocations();
tspFigure = InitializeTspPlot(cityLocation, range);
connection = InitializeConnections(cityLocation);
disp(GetPathLength(bestPath, cityLocation));
PlotPath(connection,cityLocation,bestPath);