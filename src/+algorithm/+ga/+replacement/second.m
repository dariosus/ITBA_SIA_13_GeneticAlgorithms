function population = second(data)

    k = floor(data.const.genGap * data.const.N);

    population = algorithm.ga.replacement.populate(data, k);

    population = [population; data.fun.selection2(data.const.N - k, data.alg.population)];

    population = algorithm.ga.replacement.unique(data, population, data.alg.population);
end

