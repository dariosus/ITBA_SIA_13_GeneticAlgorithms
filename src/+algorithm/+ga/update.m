function data = update(data)

    sampleFitness = 1 ./ [data.alg.population.fitness];

    data.debug.sampleErrors     = [data.debug.sampleErrors mean(sampleFitness)];
    data.debug.sampleBest       = [data.debug.sampleBest min(sampleFitness)];
    data.debug.sampleStd        = [data.debug.sampleStd std(sampleFitness)];
    data.debug.mutations        = [data.debug.mutations data.alg.mutations];
    data.debug.crossovers       = [data.debug.crossovers data.alg.crossovers];
    data.debug.backpropagations = [data.debug.backpropagations data.alg.backpropagations];

    if data.const.globalDump

        globalFitness = 1 ./ arrayfun(@(c)algorithm.ga.chromosome.evalFitness(data,c,true), data.alg.population);

        data.debug.globalErrors = [data.debug.globalErrors mean(globalFitness)];
        data.debug.globalBest   = [data.debug.globalBest min(globalFitness)];
        data.debug.globalStd    = [data.debug.globalStd std(globalFitness)];
    end

    if mod(data.alg.generation, data.const.generationsPerDump) == 0

        algorithm.debug.dumpGA(data);
    end

    if data.const.nonUniformMutation

        data.alg.pMutate = data.const.c * data.alg.pMutate;
        data.alg.pMutateStar = data.const.c * data.alg.pMutateStar;
    end

    data.alg.generation = data.alg.generation + 1;
end

