R = 1;

i=0;for j=1:R; i=i+1;params=struct('path', strcat('output',num2str(i),'/'), 'maxGenerations', 1, 'pMutate', 0, 'pMutateStar', 0, 'pBack', 1, 'pCross', 2, 'N', 2, 'uniqueTries', 0, 'maxEpochs', 5000, 'dumpNetwork', true, 'globalDump', true);algorithm.ga.main(params);end

