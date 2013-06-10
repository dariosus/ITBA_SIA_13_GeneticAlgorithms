function chromosome = main(data, chromosome)

    chromosome = algorithm.ga.network.initialize(data, chromosome);

    while chromosome.epoch < data.const.maxEpochs

        chromosome.epoch = chromosome.epoch + 1;

        data = algorithm.ga.network.shuffleInputs(data);

        for input = 1 : size(data.in.Xi, 1)

            chromosome = algorithm.ga.network.evalNetwork(data, chromosome, input);
            chromosome = algorithm.ga.network.backPropagate(data, chromosome, input);
        end

        chromosome = algorithm.ga.network.adaptativeEta(data, chromosome);
    end

    if data.const.dumpNetwork

        algorithm.debug.dumpNetwork(data, chromosome);
    end

    chromosome = rmfield(chromosome, setdiff(fieldnames(chromosome), {'W', 'fitness'}));
end

