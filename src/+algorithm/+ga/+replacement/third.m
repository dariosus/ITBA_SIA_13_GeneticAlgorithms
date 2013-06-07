function data = third(data)

    population = cell(data.const.N, 1);

    pos = 0;

    k = floor(data.const.G * data.const.N);

    if (mod(k, 2) != 0)
        k = k + 1;
    end

    newPopulation = data.alg.population;

    for pair = 1 : k / 2

        [child1 child2] = algorithm.ga.spawn(data, data.alg.population);

        newPopulation{data.const.N + pos + 1} = child1;
        newPopulation{data.const.N + pos + 2} = child2;

        pos = pos + 2;

    end

    finalPopulation = data.fun.selection(data.const.N, newPopulation);

    pos = 0;

    for individual = 1 : data.const.N

        population{pos + 1} = finalPopulation(individual);

        pos = pos + 1;

    end

    data.alg.population = population;
    data.alg.generation = data.alg.generation + 1;

end
