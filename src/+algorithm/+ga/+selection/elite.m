function selected = elite(data, k, population)

    [values indexes] = sort([population.fitness], 'descend');

    selected = population(indexes(1 : k));
end

