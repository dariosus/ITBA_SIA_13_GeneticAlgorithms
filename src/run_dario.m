R = 3;
R
i=120;for j=1:R; i=i+1;params=struct('path', strcat('output',num2str(i),'/'), 'selection', @algorithm.ga.selection.elite, 'replacement', @algorithm.ga.replacement.second);algorithm.ga.main(params);end
i=130;for j=1:R; i=i+1;params=struct('path', strcat('output',num2str(i),'/'), 'selection', @algorithm.ga.selection.elite, 'replacement', @algorithm.ga.replacement.third);algorithm.ga.main(params);end

