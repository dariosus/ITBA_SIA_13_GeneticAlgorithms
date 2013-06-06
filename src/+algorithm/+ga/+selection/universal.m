function population = universal(k, oldPopulation)

    r = 1 - rand() / k : -1 / k : 0

    population = algorithm.ga.selection.linealFitness(k, oldPopulation, r);
end

