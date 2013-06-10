function [data population] = second(data)

    k = floor(data.const.genGap * data.const.N);

    [data population] = algorithm.ga.replacement.populate(data, k);

    population = [population; data.const.selection2(data, data.const.N - k, data.alg.population)];

    population = algorithm.ga.replacement.unique(data, population, data.alg.population);
end

