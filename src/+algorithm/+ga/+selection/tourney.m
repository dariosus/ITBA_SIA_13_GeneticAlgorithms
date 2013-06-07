function selected = tourney(k, population)

    selected = repmat(population(1), k, 1);

    indexes = floor(rand(k, 2) * size(population, 1)) + 1;

    for pos = 1 : k

        if population(indexes(pos, 1)).fitness > population(indexes(pos, 2)).fitness

            indexes(pos, :) = fliplr(indexes(pos, :));
        end

        selected(pos) = population(indexes(pos, 1 + (rand() >= 0.75)));
    end
end

