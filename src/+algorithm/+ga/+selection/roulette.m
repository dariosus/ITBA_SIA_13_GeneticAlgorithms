function population = roulette(k, oldPopulation)

    r = sort(rand(k, 1), 'descend');
    population = algorithm.ga.selection.linealFitness(k, oldPopulation, r);
end

