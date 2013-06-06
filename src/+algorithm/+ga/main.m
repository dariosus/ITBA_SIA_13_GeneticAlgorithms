function main(params)

    data = algorithm.ga.initialize(params);

    algorithm.debug.print(data);

    % algorithm.debug.print(algorithm.ga.selection.roulette(5, data.alg.population));

    while ~algorithm.ga.ready(data)

        data = data.fun.replacement(data);

        data.alg.generation
        algorithm.debug.print(data.alg.population);
    end

    % algorithm.oh_yeah(data);
end

