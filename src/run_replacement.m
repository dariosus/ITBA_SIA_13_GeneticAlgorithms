R = 3;

i=290;for j=1:R; i=i+1;params=struct('path', strcat('output',num2str(i),'/'), 'selection', @algorithm.ga.selection.elite, 'replacement', @algorithm.ga.replacement.first);algorithm.ga.main(params);end

i=300;for j=1:R; i=i+1;params=struct('path', strcat('output',num2str(i),'/'), 'selection', @algorithm.ga.selection.elite, 'selection2', @algorithm.ga.selection.mixed1, 'replacement', @algorithm.ga.replacement.second);algorithm.ga.main(params);end
i=310;for j=1:R; i=i+1;params=struct('path', strcat('output',num2str(i),'/'), 'selection', @algorithm.ga.selection.mixed1, 'selection2', @algorithm.ga.selection.elite, 'replacement', @algorithm.ga.replacement.second);algorithm.ga.main(params);end
i=320;for j=1:R; i=i+1;params=struct('path', strcat('output',num2str(i),'/'), 'selection', @algorithm.ga.selection.tourney, 'selection2', @algorithm.ga.selection.elite, 'replacement', @algorithm.ga.replacement.second);algorithm.ga.main(params);end
i=330;for j=1:R; i=i+1;params=struct('path', strcat('output',num2str(i),'/'), 'selection', @algorithm.ga.selection.roulette, 'selection2', @algorithm.ga.selection.elite, 'replacement', @algorithm.ga.replacement.second);algorithm.ga.main(params);end

i=340;for j=1:R; i=i+1;params=struct('path', strcat('output',num2str(i),'/'), 'selection', @algorithm.ga.selection.elite, 'selection2', @algorithm.ga.selection.mixed1, 'replacement', @algorithm.ga.replacement.third);algorithm.ga.main(params);end
i=350;for j=1:R; i=i+1;params=struct('path', strcat('output',num2str(i),'/'), 'selection', @algorithm.ga.selection.mixed1, 'selection2', @algorithm.ga.selection.elite, 'replacement', @algorithm.ga.replacement.third);algorithm.ga.main(params);end
i=360;for j=1:R; i=i+1;params=struct('path', strcat('output',num2str(i),'/'), 'selection', @algorithm.ga.selection.tourney, 'selection2', @algorithm.ga.selection.elite, 'replacement', @algorithm.ga.replacement.third);algorithm.ga.main(params);end
i=370;for j=1:R; i=i+1;params=struct('path', strcat('output',num2str(i),'/'), 'selection', @algorithm.ga.selection.roulette, 'selection2', @algorithm.ga.selection.elite, 'replacement', @algorithm.ga.replacement.third);algorithm.ga.main(params);end
i=400;for j=1:R; i=i+1;params=struct('path', strcat('output',num2str(i),'/'), 'selection', @algorithm.ga.selection.tourney, 'selection2', @algorithm.ga.selection.elite, 'replacement', @algorithm.ga.replacement.third, 'G', 1.2);algorithm.ga.main(params);end
i=420;for j=1:R; i=i+1;params=struct('path', strcat('output',num2str(i),'/'), 'selection', @algorithm.ga.selection.roulette, 'selection2', @algorithm.ga.selection.elite, 'replacement', @algorithm.ga.replacement.third, 'G', 1.2);algorithm.ga.main(params);end
