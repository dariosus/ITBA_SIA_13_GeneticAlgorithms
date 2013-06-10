function population = third(data)

    k = floor(data.const.genGap * data.const.N);

    population = [data.alg.population; algorithm.ga.replacement.populate(data, k)];

    selected = data.const.selection2(data, data.const.N, population);

    population = algorithm.ga.replacement.unique(data, selected, population);
end

