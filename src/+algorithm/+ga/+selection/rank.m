function selected = rank(k, population)

    population = orderPopulation(population, 'ascend');

    r = sort(rand(k, 1), 'descend');

    F = sum([1 : length(population, 1)]);

    r = r * F;

    selected = repmat(population(1), k, 1);

    rpos = 1;

    for i = 1 : size(population, 1)

        F = F - i;

        while rpos <= k && r(rpos) > F

            selected(rpos) = population(i);

            rpos = rpos + 1;
        end
    end
end

