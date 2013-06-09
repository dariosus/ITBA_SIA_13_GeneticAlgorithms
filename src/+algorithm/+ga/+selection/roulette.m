function selected = roulette(data, k, population)

    r = sort(rand(k, 1), 'descend');

    selected = algorithm.ga.selection.linealFitness(k, population, r);
end

