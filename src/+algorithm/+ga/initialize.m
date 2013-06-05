function data = initialize(params)

    % Load from file

    if isfield(params, 'file')

        load(params.file, '-mat', 'data');
        return;
    end

    data = struct();

    % Default constants

    data.const = struct();
    data.const.maxGenerations = 1000;

    data.const.arch = [4 4];
    data.const.inputDim = 2;
    data.const.inputSamples = 300;
    data.const.bias = -1; % TODO: FIXME: WARNING: WTF?? EOW
    data.const.beta = 0.5;

    % data.const.selection % method of choice
    % data.const.replacement % method of choice
    % data.const.crossing % method of choice
    % data.const.mutation % method of choice

    % data.const.G % generation gap
    % data.const.pm % mutation probability
    % data.const.pb % back propagation probability
    % data.const.pc % crossing probability
    % data.const.a % mixed selection proportion
    data.const.N = 10; % population size

    data.const.generationsPerDump = 30;
    data.const.path = '';

    data.const.g = @algorithm.functions.sigmoidLog;
    data.const.dg = @algorithm.functions.DsigmoidLog;

    % Get input params

    names = fieldnames(params);
    for i = 1 : length(names)
        data.const.(names{i}) = params.(names{i});
    end

    % Fix beta to functions

    data.fun = struct();
    data.fun.g = @(x)data.const.g(data.const.beta, x);
    data.fun.dg = @(x)data.const.dg(data.const.beta, x);

    % Input

    data.in = struct();

    [data.in.allXi, data.in.allS] = algorithm.input.getInputs(data);
    [data.in.Xi, data.in.S] = algorithm.input.getRandomSamples(data);

    data.in.arch = [size(data.in.Xi, 2) data.const.arch size(data.in.S, 2)]; % Architecture

    data.in.M = length(data.in.arch); % Number of layers

    % Algorithm variables

    data.alg = struct();

    data.alg.generation = 0;
    data.alg.population = cell(data.const.N, 1);

    for i = 1 : data.const.N
        data.alg.population{i} = algorithm.chromosome.randomChromosome(data);
    end

end

