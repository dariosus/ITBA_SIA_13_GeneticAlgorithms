function selected = linealFitness(k, population, r)

    F = sum([population.fitness]);

    r = r * F;

    selected = repmat(population(1), k, 1);

    rpos = 1;

    for i = 1 : numel(population)

        F = F - population(i).fitness;

        while rpos <= k && r(rpos) > F

            selected(rpos) = population(i);

            rpos = rpos + 1;
        end
    end
end

