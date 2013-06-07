function data = collectData(data)

    sampleFitness = data.alg.population.fitness;
    globalFitness = arrayfun(@(c)algorithm.ga.chromosome.evalFitness(data,c,true), data.alg.population);

    data.debug.sampleErrors = [data.debug.sampleErrors mean(sampleFitness)];
    data.debug.globalErrors = [data.debug.globalErrors mean(globalFitness)];

    data.debug.sampleBest = [data.debug.sampleBest min(sampleFitness)];
    data.debug.globalBest = [data.debug.globalBest min(globalFitness)];

    data.debug.sampleStd = [data.debug.sampleStd std(sampleFitness)];
    data.debug.globalStd = [data.debug.globalStd std(globalFitness)];
end

