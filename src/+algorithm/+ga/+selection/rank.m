function selected = rank(data, k, population)

    [val pos] = sort([population.fitness], 'descend');

    indexes = algorithm.ga.selection.linealFitness(k, [1 : numel(population)], rand(k, 1));

    selected = population(pos(indexes));
end

