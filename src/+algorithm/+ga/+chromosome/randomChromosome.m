function chromosome = randomChromosome(data)

    chromosome = struct();

    chromosome.W = cell(data.const.M, 1);

    for m = 2 : data.const.M

        curDim = data.const.arch(m);
        oldDim = data.const.arch(m - 1) + 1;

        chromosome.W{m} = algorithm.ga.chromosome.randomAlleles(data, m, curDim, oldDim);
    end

    chromosome.fitness = algorithm.ga.chromosome.evalFitness(data, chromosome);
end

