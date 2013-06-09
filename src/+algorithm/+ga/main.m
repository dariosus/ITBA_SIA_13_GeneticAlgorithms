function main(params)

    data = algorithm.ga.initialize(params);

    while ~algorithm.ga.ready(data)

        data.alg.generation = data.alg.generation + 1;

        data.debug.fitness = [data.alg.population.fitness];

        fprintf(1, 'Generation %d: ', data.alg.generation);

        tic();

        data = data.fun.replacement(data);

        toc();

        data = algorithm.debug.collectData(data);

        if mod(data.alg.generation, data.const.generationsPerDump) == 0

            algorithm.debug.dumpGA(data);
        end
    end

    algorithm.debug.dumpGA(data);
end

