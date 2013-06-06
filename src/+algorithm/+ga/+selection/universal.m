function selected = universal(k, population)

    r = 1 - rand() / k : -1 / k : 0

    selected = algorithm.ga.selection.linealFitness(k, population, r);
end

