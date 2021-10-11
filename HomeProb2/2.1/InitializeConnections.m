function connection = InitializeConnections(cityLocation)

connection = [];
for i = 1:length(cityLocation)
   connection(i) = line([0 0], [0 0]);
end