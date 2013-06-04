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
    data.const.bias = -1;         % TODO: FIXME: WARNING: WTF?? EOW


    data.const.selection % method of choice
    data.const.replacement % method of choice
    data.const.crossing % method of choice
    data.const.mutation % method of choice

    data.const.G % generation gap
    data.const.pm % mutation probability
    data.const.pb % back propagation probability
    data.const.pc % crossing probability
    data.const.a % mixed selection proportion
    data.const.N % population size


    data.const.generationsPerDump = 30;
    data.const.path = '';

    % Get input params

    names = fieldnames(params);
    for i = 1 : length(names)
        data.const.(names{i}) = params.(names{i});
    end

    % Input

    data.in = struct();

    [data.in.allXi, data.in.allS] = algorithm.input.getInputs(data);
    [data.in.Xi, data.in.S] = algorithm.input.getRandomSamples(data);

    data.in.arch = [size(data.in.Xi, 2) arch size(data.in.S, 2)];

    % Algorithm variables

    data.alg = struct();

    data.alg.M = length(data.in.arch); % Number of layers

    data.alg.population = [];
    for i = 1 : N
        data.alg.population = [data.alg.population algorithm.individual.randomIndividual(data)];
    end

end

