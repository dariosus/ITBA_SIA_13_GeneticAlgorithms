function main(params)

    tic();

    data = algorithm.ga.initialize(params);

    while ~algorithm.ga.finish.finish(data)

        fprintf(1, 'Generation %d: ', data.alg.generation);

        data.alg.lastFitness = [data.alg.population.fitness];

        data.alg.population = data.const.replacement(data);

        data = algorithm.ga.update(data);
    end

    algorithm.debug.dumpGA(data);

    toc();
end

