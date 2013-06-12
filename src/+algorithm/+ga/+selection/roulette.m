function selected = roulette(data, k, population, unique)

    indexes = algorithm.ga.selection.linealFitness(k, [population.fitness], rand(k, 1), unique);

    selected = population(indexes);
end

