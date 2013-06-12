function main(params)

    tic();

    data = algorithm.ga.initialize(params);

    while ~algorithm.ga.finish.finish(data)

        fprintf(1, '%d ', data.alg.generation);

        data = algorithm.ga.replacement(data);

        data = algorithm.ga.update(data);
    end

    algorithm.debug.dumpGA(data);

    toc();
end

