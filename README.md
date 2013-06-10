Para correr el código del tp, abrir matlab, agrgar la carpeta `src` al path, y ejecutar `src/run.m`.

Opcionalmente, se pueden setear en el struct params los siguientes parametros para pisar los valores default:

```
% General

arch = [9 8];
inputDim = 2;
inputSamples = 300;
bias = -1;
beta = 1;

% Genetic algorithm

maxGenerations = 17;
genGap = 0.8; % generation gap
pMutate = 0.003; % single locus mutation probability
pMutateStar = 0.1; % chromosome mutation probability
pBack = 0.1; % back propagation probability
pCross = 0.75; % crossing probability
p = 0.05; % uniform crossover probability per locus
a = 0.5; % mixed selection proportion
c = 0.95; % mutation reduction ratio
N = 60; % population size
uniqueTries = 2; % tries to remove repeated chromosomes
targetFitness = 0.000001;
contentGenerations = 10;
changeRatio = 0.8;
nonUniformMutation = true;
tempFactor = 1; % boltzmann's temperature factor

% Neuronal network

maxEpochs = 80;
rollback = true;
momentum = 0.3;
eta = 0.4;
etaEps = 0.001;
etaInc = 0.1;
etaDec = 0.001;
etaSteps = 2;

% Debug

dumpNetwork = false;
globalDump = false;
generationsPerDump = 1000;
path = '';

% Functions

g  = @algorithm.functions.sigmoidLog;
dg = @algorithm.functions.DsigmoidLog;

selection   = @algorithm.ga.selection.elite;
selection2  = @algorithm.ga.selection.roulette;
crossover   = @algorithm.ga.crossover.annular;
mutation    = @algorithm.ga.mutation.locus;
replacement = @algorithm.ga.replacement.first;
```

