function data = second(data)

    population = cell(data.const.N, 1);

    pos = 0;

    k = floor(data.const.G * data.const.N);

    if (mod(k, 2) != 0)
        k = k + 1;
    end

    for pair = 1 : k / 2

        [child1 child2] = algorithm.ga.spawn(data, data.alg.population);

        population{pos + 1} = child1;
        population{pos + 2} = child2;

        pos = pos + 2;

    end

    intactParents = data.fun.selection(data.const.N - k, data.alg.population);

    for parent = 1 : data.const.N - k

        population{pos + 1} = intactParents(parent);

        pos = pos + 1;

    end

    data.alg.population = population;
    data.alg.generation = data.alg.generation + 1;

end
