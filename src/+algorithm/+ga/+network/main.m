function chromosome = main(data, chromosome)

    [data chromosome] = algorithm.ga.network.initialize(data, chromosome);

    while data.alg.epoch < data.const.maxEpochs

        data.alg.epoch = data.alg.epoch + 1;

        data = algorithm.ga.network.shuffleInputs(data);

        for input = 1 : size(data.in.Xi, 1)

            chromosome = algorithm.ga.network.evalNetwork(data, chromosome, input);
            chromosome = algorithm.ga.network.backPropagate(data, chromosome, input);
            % data = algorithm.adaptativeEta(input, data);
        end
    end

    chromosome = rmfield(chromosome, {'h', 'V', 'dW'});
end

