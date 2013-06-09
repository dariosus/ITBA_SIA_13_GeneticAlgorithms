function selected = universal(data, k, population)

    r = [1 - rand() / k : -1 / k : 0];

    indexes = algorithm.ga.selection.linealFitness(k, [population.fitness], r);

    selected = population(indexes);
end

