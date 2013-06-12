function data = third(data, k)

    r = floor(data.const.offsprings * data.const.N);

    population = data.const.selection2(data, r, data.const.population, false);

    [data population] = algorithm.ga.replacement.spawn(data, population(randperm(k)));

    population = [data.alg.population; population];

    data.alg.population = data.const.selection2(data, k, population, false);
end

