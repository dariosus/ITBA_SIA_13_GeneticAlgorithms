R = 3;
i=140;for j=1:R; i=i+1;params=struct('path', strcat('output',num2str(i),'/'), 'selection', @algorithm.ga.selection.elite, 'selection2', @algorithm.ga.selection.mixed1, 'replacement', @algorithm.ga.replacement.second);algorithm.ga.main(params);end

