function [data population] = third(data)

    k = floor(data.const.genGap * data.const.N);

    [data population] = algorithm.ga.replacement.populate(data, k);

    population = [data.alg.population; population];

    selected = data.const.selection2(data, data.const.N, population);

    population = algorithm.ga.replacement.unique(data, selected, population);
end

