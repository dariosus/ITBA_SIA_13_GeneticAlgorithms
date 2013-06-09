function data = second(data)

    k = floor(data.const.genGap * data.const.N);

    population = algorithm.ga.replacement.populate(data, k);

    population = [population; data.fun.selection(data.const.N - k, data.alg.population)];

    data.alg.population = algorithm.ga.replacement.unique(data, population, data.alg.population);

    data.alg.generation = data.alg.generation + 1;
end

