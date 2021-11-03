clear
load('\\130.60.169.45\methlab\AI4H\features\sensorpower fooofed\x.mat')
load('\\130.60.169.45\methlab\AI4H\features\sensorpower fooofed\ids.mat');
%% prepare for ML
% e1hz1, e1hz2, ...., e1hz79, e2hz1, e2hz2, ....., e2hz79, e3hz1 - this
% structure should be applied
foofed_spectra = reshape(x,[2042,8295]);
foofed_spectra = num2cell(foofed_spectra);
foofed_spectra = horzcat(ids, foofed_spectra) ;


filename = 'foofed_spectra.csv';    %must end in csv
writetable( cell2table(foofed_spectra), filename, 'writevariablenames', true)
