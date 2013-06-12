function [runs start params tests] = selection()

    runs = 3;

    start = 650;

    params = struct( ...
        'maxGenerations', 20, ...
        'pMutateStar', 0.1, ...
        'pBack', 0.1, ...
        'pCross', 0.75, ...
        'p', 0.05, ...
        'c', 0.95, ...
        'N', 30, ...
        'G', 0.9, ...
        'nonUniformMutation', true, ...
        'crossover', @algorithm.ga.crossover.annular, ...
        'mutation', @algorithm.ga.mutation.chromosome, ...
        'replacement', @algorithm.ga.replacement.first, ...
        'selection2', @algorithm.ga.selection.roulette ...
    );

    tests = {
        struct('name', 'elite'       , 'selection', @algorithm.ga.selection.elite),
        struct('name', 'roulette'    , 'selection', @algorithm.ga.selection.roulette),
        struct('name', 'tourney'     , 'selection', @algorithm.ga.selection.tourney),
        struct('name', 'rank'        , 'selection', @algorithm.ga.selection.rank),
        struct('name', 'borrame'     , 'selection', @algorithm.ga.selection.boltzmann),
        struct('name', 'borrame'     , 'selection', @algorithm.ga.selection.boltzmann),
        struct('name', 'boltzmann'   , 'selection', @algorithm.ga.selection.boltzmann),
        struct('name', 'universal'   , 'selection', @algorithm.ga.selection.universal),
        struct('name', 'mixed1(a=.1)', 'selection', @algorithm.ga.selection.mixed1, 'a', 0.1),
        struct('name', 'mixed1(a=.2)', 'selection', @algorithm.ga.selection.mixed1, 'a', 0.2),
        struct('name', 'mixed2(a=.1)', 'selection', @algorithm.ga.selection.mixed2, 'a', 0.1),
        struct('name', 'mixed2(a=.2)', 'selection', @algorithm.ga.selection.mixed2, 'a', 0.2)
    };
end

