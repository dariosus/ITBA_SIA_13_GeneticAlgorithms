function data = third(data)

    k = floor(data.const.genGap * data.const.N);

    population = [data.alg.population; algorithm.ga.replacement.populate(data, k)];

    selected = data.fun.selection(data.const.N, population);

    data.alg.population = algorithm.ga.replacement.unique(data, selected, population);
end

