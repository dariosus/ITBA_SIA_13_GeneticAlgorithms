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

    data.const.arch = [9 8];
    data.const.inputDim = 2;
    data.const.inputSamples = 300;
    data.const.bias = -1;
    data.const.beta = 1;

    data.const.maxGenerations = 1000;
    data.const.genGap = 0.6; % generation gap
    data.const.pMutate = 0.001; % single locus mutation probability
    data.const.pMutateStar = 0.1; % chromosome mutation probability
    data.const.pBack = 0.1; % back propagation probability
    data.const.pCross = 0.7; % crossing probability
    data.const.p = 0.1; % uniform crossover probability per locus
    % data.const.a % mixed selection proportion
    data.const.N = 80; % population size

    data.const.maxEpochs = 200;
    data.const.rollback = true;
    data.const.momentum = 0.3;
    data.const.eta = 0.4;
    data.const.etaEps = 0.001;
    data.const.etaInc = 0.1;
    data.const.etaDec = 0.001;
    data.const.etaSteps = 3;

    data.const.generationsPerDump = 1;
    data.const.path = '';

    data.const.g  = @algorithm.functions.sigmoidLog;
    data.const.dg = @algorithm.functions.DsigmoidLog;

    data.const.selection   = @algorithm.ga.selection.roulette;
    data.const.crossover   = @algorithm.ga.crossover.singlePoint;
    data.const.mutation    = @algorithm.ga.mutation.locus;
    data.const.replacement = @algorithm.ga.replacement.first;

    names = fieldnames(params);
    for i = 1 : length(names)
        data.const.(names{i}) = params.(names{i});
    end

    %%%
    %% Input
    %%%

    data.fun.g  = @(x)data.const.g(data.const.beta, x);
    data.fun.dg = @(x)data.const.dg(data.const.beta, x);

    [data.in.allXi, data.in.allS] = algorithm.input.getInputs(data);
    [data.in.Xi,    data.in.S   ] = algorithm.input.getRandomSamples(data);

    data.in.arch = [size(data.in.Xi, 2) data.const.arch size(data.in.S, 2)]; % Architecture

    data.in.M = length(data.in.arch); % Number of layers

    data = algorithm.ga.chromosome.initializeCoords(data);

    %%%
    %% Functions
    %%%

    data.fun.selection   = @(k, population)data.const.selection(k, population);
    data.fun.crossover   = @(dad, mom)data.const.crossover(data, dad, mom);
    data.fun.mutation    = @(parent)data.const.mutation(data, parent);
    data.fun.replacement = @(data)data.const.replacement(data);

    %%%
    %% Algorithm
    %%%

    data.alg.generation = 0;
    data.alg.population = arrayfun(@(x)algorithm.ga.chromosome.randomChromosome(data), [1 : data.const.N])';

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

