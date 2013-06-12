function [runs start params tests] = mutation()

    runs = 3;

    start = 850;

    params = struct( ...
        'maxGenerations', 20, ...
        'pBack', 0.1, ...
        'pCross', 0.75, ...
        'p', 0.05, ...
        'N', 30, ...
        'G', 0.9, ...
        'nonUniformMutation', true, ...
        'crossover', @algorithm.ga.crossover.annular, ...
        'replacement', @algorithm.ga.replacement.first, ...
        'selection', @algorithm.ga.selection.elite, ...
        'selection2', @algorithm.ga.selection.roulette ...
    );

    tests = {
        struct('name', 'chromosome(pM*=.5;c=1)', 'mutation', @algorithm.ga.mutation.chromosome, 'pMutateStar', 0.5, 'c', 1), ...
        struct('name', 'chromosome(pM*=.1;c=1)', 'mutation', @algorithm.ga.mutation.chromosome, 'pMutateStar', 0.1, 'c', 1), ...
        struct('name', 'chromosome(pM*=.5;c=.95)', 'mutation', @algorithm.ga.mutation.chromosome, 'pMutateStar', 0.5, 'c', 0.95), ...
        struct('name', 'chromosome(pM*=.1;c=.95)', 'mutation', @algorithm.ga.mutation.chromosome, 'pMutateStar', 0.1, 'c', 0.95), ...
        struct('name', 'locus(pM=.01;c=1)', 'mutation', @algorithm.ga.mutation.locus, 'pMutate', 0.01, 'c', 1), ...
        struct('name', 'locus(pM=.001;c=1)', 'mutation', @algorithm.ga.mutation.locus, 'pMutate', 0.001, 'c', 1), ...
        struct('name', 'locus(pM=.01;c=.95)', 'mutation', @algorithm.ga.mutation.locus, 'pMutate', 0.01, 'c', 0.95), ...
        struct('name', 'locus(pM=.001;c=.95)', 'mutation', @algorithm.ga.mutation.locus, 'pMutate', 0.001, 'c', 0.95) ...
    };
end
