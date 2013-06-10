function chromosome = initialize(data, chromosome)

    chromosome.V = cell(data.const.M, 1);
    chromosome.h = cell(data.const.M, 1);
    chromosome.dW = cell(data.const.M, 1);

    for n = 1 : data.const.M
        chromosome.dW{n} = zeros(size(chromosome.W{n}));
    end

    chromosome.epoch = 0;
    chromosome.eta = data.const.eta;
    chromosome.curError = 0;
    chromosome.goodSteps = 0;

    chromosome.debug = struct();

    chromosome.debug.rollbacks = 0;
    chromosome.debug.goodSteps = 0;
    chromosome.debug.cumRollbacks = [];
    chromosome.debug.cumGoodSteps = [];
    chromosome.debug.etas = [];
    chromosome.debug.errors = [];
end

