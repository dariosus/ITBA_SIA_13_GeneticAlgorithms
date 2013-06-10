function selected = boltzmann(data, k, population)

    T = (1 - data.alg.generation / data.const.maxGeneration) * data.const.tempFactor;

    expValues = exp([population.fitness] ./ T);

    indexes = algorithm.ga.selection.linealFitness(k, expValues, rand(k, 1));
    selected = population(indexes);
end

