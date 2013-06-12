function selected = boltzmann(data, k, population, unique)

    T = (1 - data.alg.generation / data.const.maxGenerations) * data.const.tempFactor;

    expValues = exp([population.fitness] ./ T);

    indexes = algorithm.ga.selection.linealFitness(k, expValues, rand(k, 1), unique);

    selected = population(indexes);
end

