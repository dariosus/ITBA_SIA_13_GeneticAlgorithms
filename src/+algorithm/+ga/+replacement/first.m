function data = first(data)

    population = data.alg.population;

    pos = 1;

    for pair = 1 : data.const.N / 2

        [child1 child2] = algorithm.ga.spawn(data, data.alg.population);

        population(pos : pos + 1) = [child1 child2];

        pos = pos + 2;

        algorithm.debug.printProgress(pair, data.const.N / 2);
    end

    data.alg.population = population;
    data.alg.generation = data.alg.generation + 1;
end

