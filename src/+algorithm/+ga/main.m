function main(params)

    data = algorithm.ga.initialize(params);

    % algorithm.debug.print(data);

    % algorithm.debug.print(algorithm.ga.selection.roulette(5, data.alg.population));

    while ~algorithm.ga.ready(data)

        data = data.fun.replacement(data);

        data = algorithm.debug.collectData(data);

        if mod(data.alg.generation, data.const.generationsPerDump) == 0

            algorithm.debug.dump(data);
        end

        data.alg.generation

        % algorithm.debug.print(data.alg.population);
    end

    % algorithm.oh_yeah(data);
end

