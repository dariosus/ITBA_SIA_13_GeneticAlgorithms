function selected = mixed2(data, k, population, unique)

    k1 = floor(k * data.const.a);

    selectedElite = algorithm.ga.selection.elite(data, k1, population, unique);

    selectedUniversal = algorithm.ga.selection.universal(data, k - k1, population, unique);

    selected = [selectedElite; selectedUniversal];
end

