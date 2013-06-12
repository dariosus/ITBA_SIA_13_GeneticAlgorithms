function selected = universal(data, k, population, unique)

    r = [1 - rand() / k : -1 / k : 0];

    indexes = algorithm.ga.selection.linealFitness(k, [population.fitness], r, unique);

    selected = population(indexes);
end

