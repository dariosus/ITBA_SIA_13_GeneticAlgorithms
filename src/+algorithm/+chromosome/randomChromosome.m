function chromosome = randomChromosome(data)

    chromosome = struct();

    chromosome.W = cell(data.alg.M, 1); % Weights

    for m = 1 : data.alg.M

        curDim = data.in.arch(m);

        if m > 1

            oldDim = data.in.arch(m - 1) + 1;

            chromosome.W{m} = 2 / sqrt(oldDim) .* (rand(curDim, oldDim) - 0.5);

            chromosome.W{m}(:, 1) = data.const.bias;
        end
    end

    chromosome = evalFitness(data, chromosome);
end

