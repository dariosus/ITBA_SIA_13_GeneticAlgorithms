function data = first(data, k)

    population = data.alg.population;

    pos = 1;

    for pos = 1 : 2 : k

        children = data.const.selection2(data, 2, data.alg.population, false);

        [data children] = algorithm.ga.replacement.spawn(data, children);

        population(pos : pos + 1) = children;
    end

    data.alg.population = population(1 : k);
end

