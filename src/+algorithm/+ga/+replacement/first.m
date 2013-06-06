function data = first(data)

    population = cell(data.const.N, 1);

    for pair = 1 : data.const.N / 2

        [child1 child2] = spawn(data);

        population = [population child1 child2];
    end

    data.alg.population = population;
    data.alg.generation = data.alg.generation + 1;
end

