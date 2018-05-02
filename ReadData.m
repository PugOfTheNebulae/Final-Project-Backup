% script ReadData reads the data for FoodForThought project from excel
% sheet and transforms it to a more friendly structure form
%
% code author: sid hillwig
T = readtable('FoodDataset.xlsx','Range','B1:AB1420');
%% forming structures
areaCodes = unique(T{:,1}); % is an array
foodGroups = T{:,2}(1:end); % is a cell
areaNames = unique(T{:,3}); % is a cell
lat = unique(T{:,4},'stable'); % is an array
long = unique(T{:,5},'stable'); % is an array
foodData = T{:,6:end}; % is an array

for j = (1:length(areaNames(:))) % iterating over nAreas
   startIn = ((areaCodes(j)-1)*10) + areaCodes(j);
   stopIn = startIn + 10;
   area(j) = CreateStructure(areaNames{j},lat(j),long(j),foodData(startIn:stopIn,:));
end
