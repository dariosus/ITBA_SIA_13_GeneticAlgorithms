function selected = mixed1(data, k, population)

    k1 = floor(k * data.const.a);

    selectedElite = algorithm.ga.selection.elite(k1, population);
    selectedRoulette = algorithm.ga.selection.roulette(k - k1, population);

    selected = [selectedElite; selectedRoulette];
end

