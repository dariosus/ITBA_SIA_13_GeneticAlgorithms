function [data chromosome] = initialize(data, chromosome)

    chromosome.V = cell(data.in.M, 1);
    chromosome.h = cell(data.in.M, 1);
    chromosome.dW = cell(data.in.M, 1);

    for n = 1 : data.in.M
        chromosome.dW{n} = zeros(size(chromosome.W{n}));
    end

    data.alg.epoch = 0;
    data.alg.momentum = data.const.momentum;
    data.alg.eta = data.const.eta;
    data.alg.goodSteps = 0;
    data.alg.rollbacks = 0;
    data.alg.lastError = -1;
    data.alg.totalGoodSteps = 0;
end

