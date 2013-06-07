function data = second(data)

    population = data.alg.population;

    pos = 1;

    k = floor(data.const.G * data.const.N);
    k = k + mod(k, 2);

    for pair = 1 : k / 2

        [child1 child2] = algorithm.ga.spawn(data, data.alg.population);

        population(pos : pos + 1) = [child1 child2];

        pos = pos + 2;

        algorithm.debug.printProgress(pair, k / 2);
    end

    survivors = data.fun.selection(data.const.N - k, data.alg.population);

    population(pos : end) = data.alg.population(survivors);

    data.alg.population = population;
    data.alg.generation = data.alg.generation + 1;
end

