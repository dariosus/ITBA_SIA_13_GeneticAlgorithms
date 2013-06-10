function data = initialize(params)

    %%%
    %% Load from file
    %%%

    if isfield(params, 'file')

        load(params.file, '-mat', 'data');
        return;
    end

    %%%
    %% Data struct
    %%%

    data = struct();

    data.const = struct();
    data.in    = struct();
    data.fun   = struct();
    data.alg   = struct();
    data.debug = struct();

    %%%
    %% Constants
    %%%

    % General

    data.const.arch = [9 8];
    data.const.inputDim = 2;
    data.const.inputSamples = 300;
    data.const.bias = -1;
    data.const.beta = 1;

    % Genetic algorithm

    data.const.maxGenerations = 17;
    data.const.genGap = 0.8; % generation gap
    data.const.pMutate = 0.003; % single locus mutation probability
    data.const.pMutateStar = 0.1; % chromosome mutation probability
    data.const.pBack = 0.1; % back propagation probability
    data.const.pCross = 0.75; % crossing probability
    data.const.p = 0.05; % uniform crossover probability per locus
    data.const.a = 0.5; % mixed selection proportion
    data.const.c = 0.95; % mutation reduction ratio
    data.const.N = 60; % population size
    data.const.uniqueTries = 2; % tries to remove repeated chromosomes
    data.const.targetFitness = 0.001;
    data.const.contentGenerations = 10;
    data.const.changeRatio = 0.8;
    data.const.nonUniformMutation = false;

    % Neuronal network

    data.const.maxEpochs = 80;
    data.const.rollback = true;
    data.const.momentum = 0.3;
    data.const.eta = 0.4;
    data.const.etaEps = 0.001;
    data.const.etaInc = 0.1;
    data.const.etaDec = 0.001;
    data.const.etaSteps = 2;

    % Debug

    data.const.dumpNetwork = false;
    data.const.globalDump = false;
    data.const.generationsPerDump = 1000;
    data.const.path = '';

    % Functions

    data.const.g  = @algorithm.functions.sigmoidLog;
    data.const.dg = @algorithm.functions.DsigmoidLog;

    data.const.selection   = @algorithm.ga.selection.roulette;
    data.const.selection2  = @algorithm.ga.selection.roulette;
    data.const.crossover   = @algorithm.ga.crossover.uniform;
    data.const.mutation    = @algorithm.ga.mutation.chromosome;
    data.const.replacement = @algorithm.ga.replacement.first;

    % Override with user params

    names = fieldnames(params);
    for i = 1 : length(names)
        data.const.(names{i}) = params.(names{i});
    end

    data.const.g  = @(x)data.const.g(data.const.beta, x);
    data.const.dg = @(x)data.const.dg(data.const.beta, x);

    %%%
    %% Input
    %%%

    [data.in.allXi, data.in.allS] = algorithm.input.getInputs(data);
    [data.in.Xi,    data.in.S   ] = algorithm.input.getRandomSamples(data);

    % Derived params

    data.const.arch = [size(data.in.Xi, 2) data.const.arch size(data.in.S, 2)];
    data.const.M    = numel(data.const.arch);

    data.const.linearCoords = algorithm.ga.chromosome.linearCoords(data);
    data.const.numLocus     = size(data.const.linearCoords, 1);

    %%%
    %% Algorithm
    %%%

    data.alg.generation = 1;
    data.alg.population = arrayfun(@(x)algorithm.ga.chromosome.randomChromosome(data), [1 : data.const.N])';

    data.alg.pMutate = data.const.pMutate;
    data.alg.pMutateStar = data.const.pMutateStar;

    data.alg.lastFitness = [];

    %%%
    %% Debug
    %%%

    data.debug.sampleErrors = [];
    data.debug.globalErrors = [];
    data.debug.sampleBest = [];
    data.debug.globalBest = [];
    data.debug.sampleStd = [];
    data.debug.globalStd = [];
end

