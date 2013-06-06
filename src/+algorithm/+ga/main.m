function main(params)

    data = algorithm.ga.initialize(params);

    % algorithm.debug.print(data);
    % algorithm.debug.print(algorithm.ga.selection.roulette(5, data.alg.population));

    while true % ~algorithm.ready(data)

        data = data.fun.replacement(data);

        algorithm.debug.print(data);
    end

    % algorithm.oh_yeah(data);
end

