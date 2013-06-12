function data = second(data, k)

    population = data.const.selection2(data, k, false);

    [data population] = algorithm.ga.replacement.spawn(data, population(randperm(k)));

    data.alg.population = population;
end

