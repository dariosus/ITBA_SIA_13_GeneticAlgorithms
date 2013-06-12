function selected = tourney(data, k, population, unique, tries)

    selected = repmat(population(1), k, 1);

    indexes = floor(rand(k, 2) * numel(population)) + 1;

    for pos = 1 : k

        if population(indexes(pos, 1)).fitness < population(indexes(pos, 2)).fitness

            indexes(pos, :) = fliplr(indexes(pos, :));
        end

        selected(pos) = population(indexes(pos, 1 + (rand() >= 0.75)));
    end

    if nargin < 5
        tries = 1;
    end

    if unique && tries < data.const.uniqueTries

        [values indexes] = sort([selected.fitness]);

        equals = [];

        for i = 2 : data.const.N

            if values(i - 1) == values(i)

                equals = [equals indexes(i)];
            end
        end

        if ~isempty(equals)

            selected(equals) = tourney(data, numel(equals), population, unique, tries + 1);
        end
    end
end

