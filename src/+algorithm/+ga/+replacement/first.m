function data = first(data)

    population = cell(data.const.N, 1);

    pos = 0;

    for pair = 1 : data.const.N / 2

        [child1 child2] = algorithm.ga.spawn(data, data.alg.population);

        population{pos + 1} = child1;
        population{pos + 2} = child2;

        pos = pos + 2;
    end

    data.alg.population = population;
    data.alg.generation = data.alg.generation + 1;
end

