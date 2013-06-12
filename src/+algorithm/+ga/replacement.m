function data = replacement()

    data.alg.lastFitness = [data.alg.population.fitness];

    k = floor(data.const.genGap * data.const.N);

    unchanged = data.const.selection(data, data.const.N - k, data.population, true);

    data = data.const.replacement(data, k);

    data.alg.population = [unchanged data.alg.population];
end

