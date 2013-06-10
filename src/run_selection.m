R = 1;

i=71;for j=1:R; i=i+1;params=struct('path', strcat('output',num2str(i),'/'), 'selection', @algorithm.ga.selection.elite);algorithm.ga.main(params);end
i=81;for j=1:R; i=i+1;params=struct('path', strcat('output',num2str(i),'/'), 'selection', @algorithm.ga.selection.mixed1);algorithm.ga.main(params);end
% i=90;for j=1:R; i=i+1;params=struct('path', strcat('output',num2str(i),'/'), 'selection', @algorithm.ga.selection.mixed2);algorithm.ga.main(params);end
% i=100;for j=1:R; i=i+1;params=struct('path', strcat('output',num2str(i),'/'), 'selection', @algorithm.ga.selection.roulette);algorithm.ga.main(params);end
% i=110;for j=1:R; i=i+1;params=struct('path', strcat('output',num2str(i),'/'), 'selection', @algorithm.ga.selection.tourney);algorithm.ga.main(params);end
% i=180;for j=1:R; i=i+1;params=struct('path', strcat('output',num2str(i),'/'), 'selection', @algorithm.ga.selection.boltzmann);algorithm.ga.main(params);end
i=201;for j=1:R; i=i+1;params=struct('path', strcat('output',num2str(i),'/'), 'selection', @algorithm.ga.selection.mixed1, 'a', 0.9);algorithm.ga.main(params);end
i=211;for j=1:R; i=i+1;params=struct('path', strcat('output',num2str(i),'/'), 'selection', @algorithm.ga.selection.mixed2, 'a', 0.9);algorithm.ga.main(params);end
i=221;for j=1:R; i=i+1;params=struct('path', strcat('output',num2str(i),'/'), 'selection', @algorithm.ga.selection.mixed1, 'a', 0.1);algorithm.ga.main(params);end
i=231;for j=1:R; i=i+1;params=struct('path', strcat('output',num2str(i),'/'), 'selection', @algorithm.ga.selection.mixed2, 'a', 0.1);algorithm.ga.main(params);end

