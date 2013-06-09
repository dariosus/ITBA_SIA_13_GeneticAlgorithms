R = 3;

i=10;for j=1:R; i=i+1;params=struct('path', strcat('output',num2str(i),'/'), 'crossover', @algorithm.ga.crossover.annular);algorithm.ga.main(params);end
i=20;for j=1:R; i=i+1;params=struct('path', strcat('output',num2str(i),'/'), 'crossover', @algorithm.ga.crossover.doublePoint);algorithm.ga.main(params);end
i=30;for j=1:R; i=i+1;params=struct('path', strcat('output',num2str(i),'/'), 'crossover', @algorithm.ga.crossover.singlePoint);algorithm.ga.main(params);end
i=40;for j=1:R; i=i+1;params=struct('path', strcat('output',num2str(i),'/'), 'crossover', @algorithm.ga.crossover.uniform);algorithm.ga.main(params);end

