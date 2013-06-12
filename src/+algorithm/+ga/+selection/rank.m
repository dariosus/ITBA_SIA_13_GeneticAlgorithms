function selected = rank(data, k, population, unique)

    [val pos] = sort([population.fitness], 'descend');

    indexes = algorithm.ga.selection.linealFitness(k, [1 : numel(population)], rand(k, 1), unique);

    selected = population(pos(indexes));
end

