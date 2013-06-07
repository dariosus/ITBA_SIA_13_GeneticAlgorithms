function selected = elite(k, population)

    [values indexes] = sort([population.fitness]);

    selected = population(indexes(1 : k));
end

