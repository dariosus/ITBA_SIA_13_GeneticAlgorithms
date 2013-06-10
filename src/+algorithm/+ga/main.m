function main(params)

    data = algorithm.ga.initialize(params);

    while ~algorithm.ga.ready(data)

        fprintf(1, 'Generation %d: ', data.alg.generation);

        tic();

        data.alg.lastFitness = [data.alg.population.fitness];

        data.alg.population = data.fun.replacement(data);

        toc();

        data = algorithm.ga.update(data);
    end

    algorithm.debug.dumpGA(data);
end

