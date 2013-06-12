function selected = mixed1(data, k, population, unique)

    k1 = floor(k * data.const.a);

    selectedElite = algorithm.ga.selection.elite(data, k1, population, unique);

    selectedRoulette = algorithm.ga.selection.roulette(data, k - k1, population, unique);

    selected = [selectedElite; selectedRoulette];
end

