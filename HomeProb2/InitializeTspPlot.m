function tspFigure = InitializeTspPlot(cityLocation,range)

tspFigure = figure(1);
set(tspFigure,'DoubleBuffer','on');
axis([range(1),range(2),range(3),range(4)]);
axis square;
grid on;
city = [];
for i = 1:length(cityLocation)
   city(i) = rectangle('Position', [cityLocation(i,1)-0.25 cityLocation(i,2)-0.25 0.5 0.5],'Curvature', [1 1]);
end
   