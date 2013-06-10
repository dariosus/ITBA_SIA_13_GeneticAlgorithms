function data = update(data)

    sampleFitness = [data.alg.population.fitness];

    data.debug.sampleErrors = [data.debug.sampleErrors mean(1 ./ sampleFitness)];
    data.debug.sampleBest   = [data.debug.sampleBest min(1 ./ sampleFitness)];
    data.debug.sampleStd    = [data.debug.sampleStd std(1 ./ sampleFitness)];
    data.debug.mutations    = [data.debug.mutations data.alg.mutation];
    data.debug.crossovers   = [data.debug.crossovers data.alg.crossover];

    if data.const.globalDump

        globalFitness = arrayfun(@(c)algorithm.ga.chromosome.evalFitness(data,c,true), data.alg.population);

        data.debug.globalErrors = [data.debug.globalErrors mean(1 ./ globalFitness)];
        data.debug.globalBest   = [data.debug.globalBest min(1 ./ globalFitness)];
        data.debug.globalStd    = [data.debug.globalStd std(1 ./ globalFitness)];
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

