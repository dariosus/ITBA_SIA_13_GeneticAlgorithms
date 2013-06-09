function selected = mixed2(data, k, population)

    k1 = floor(k * data.const.a);

    selectedElite = algorithm.ga.selection.elite(data, k1, population);

    selectedUniversal = algorithm.ga.selection.universal(data, k - k1, population);

    selected = [selectedElite; selectedUniversal];
end

