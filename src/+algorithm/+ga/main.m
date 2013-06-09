function main(params)

    data = algorithm.ga.initialize(params);

    while ~algorithm.ga.ready(data)

        tic();

        fprintf(1, 'Generation %d: ', data.alg.generation + 1);

        data = data.fun.replacement(data);

        data = algorithm.debug.collectData(data);

        toc();

        if mod(data.alg.generation, data.const.generationsPerDump) == 0

            algorithm.debug.dumpGA(data);
        end
    end

    algorithm.debug.dumpGA(data);
end

