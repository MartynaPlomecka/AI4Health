clear
app = load('\\130.60.169.45\methlab\AI4H\features\sensorpower fooofed\app.mat');
ids = load('\\130.60.169.45\methlab\AI4H\features\sensorpower fooofed\ids.mat');
%%
mystruct = app.app;
mystruct = mystruct';
id = ids.ids

for i= 1:length(mystruct)
    intercept(i) =  mystruct{i}(1);
end
intercept = intercept';

for i= 1:length(mystruct)
    slope(i) =  mystruct{i}(2);
end
slope = slope';

slope = num2cell(slope)
intercept = num2cell(intercept)

C = horzcat(id, intercept, slope)


filename = 'foof2features.csv';    %must end in csv
writetable( cell2table(C), filename, 'writevariablenames', true)




