function selected = roulette(data, k, population)

    indexes = algorithm.ga.selection.linealFitness(k, [population.fitness], rand(k, 1));

    selected = population(indexes);
end

