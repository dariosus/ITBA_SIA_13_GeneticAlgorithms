function selected = boltzmann(data, k, population, unique)

    T = (data.const.maxGenerations - data.alg.generation + 1) * 10000;

    expValues = exp([population.fitness] ./ T);

    indexes = algorithm.ga.selection.linealFitness(k, expValues, rand(k, 1), unique);

    selected = population(indexes);
end

