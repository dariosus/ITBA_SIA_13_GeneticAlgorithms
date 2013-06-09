function data = first(data)

    data.alg.population = algorithm.ga.replacement.populate(data, data.const.N);

    data.alg.generation = data.alg.generation + 1;
end

