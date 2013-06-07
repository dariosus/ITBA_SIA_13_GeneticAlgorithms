function chromosome = randomChromosome(data)

    chromosome = struct();

    chromosome.W = cell(data.in.M, 1);

    for m = 2 : data.in.M

        curDim = data.in.arch(m);
        oldDim = data.in.arch(m - 1) + 1;

        chromosome.W{m} = algorithm.ga.chromosome.randomAlleles(data, m, curDim, oldDim);
    end

    chromosome.fitness = algorithm.ga.chromosome.evalFitness(data, chromosome);
end

