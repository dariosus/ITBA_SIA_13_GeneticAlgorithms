params = struct();

params.maxGenerations = 100;
params.N = 10;
params.maxEpochs = 40;
params.dumpNetwork = true;
params.globalDump = true;
params.generationsPerDump = 1;
params.pMutate = 0.001;
params.pBack = 0;

algorithm.ga.main(params);

