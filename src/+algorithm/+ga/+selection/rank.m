function selected = rank(data, k, population)

    [values indexes] = sort([population.fitness], 'descend');

    F = sum(indexes);

    r = sort(rand(k, 1), 'descend') * F;

    selected = repmat(population(1), k, 1);

    rpos = 1;

    for i = 1 : numel(population)

        F = F - i;

        while rpos <= k && r(rpos) > F

            selected(rpos) = population(indexes(i));

            rpos = rpos + 1;
        end
    end
end

