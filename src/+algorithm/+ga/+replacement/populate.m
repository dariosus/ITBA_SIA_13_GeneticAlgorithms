function [data population] = populate(data, n)

    population = repmat(data.alg.population(1), n + 1, 1);

    pos = 1;

    for pair = 1 : (n + 1) / 2

        [data child1 child2] = algorithm.ga.replacement.spawn(data, data.alg.population);

        population(pos : pos + 1) = [child1 child2];

        pos = pos + 2;

        algorithm.debug.printProgress(pair, n / 2);
    end

    population = population(1 : n);
end

