function main(params)

    data = algorithm.ga.initialize(params);

    % algorithm.debug.print(data);

    % algorithm.debug.print(algorithm.ga.selection.roulette(5, data.alg.population));

    while ~algorithm.ga.ready(data)

        fprintf(1, 'Generation %d: ', data.alg.generation + 1);

        data = data.fun.replacement(data);

        data = algorithm.debug.collectData(data);

        if mod(data.alg.generation, data.const.generationsPerDump) == 0

            algorithm.debug.dumpGA(data);
        end

        % algorithm.debug.print(data.alg.population);
    end

    algorithm.debug.dumpGA(data);
end

