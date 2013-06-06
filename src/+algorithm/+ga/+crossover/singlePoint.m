function [child1 child2] = singlePoint(data, dad, mom)

    r1 = floor(rand() * (data.alg.numLocus - 1)) + 2;
    r2 = data.alg.numLocus;

    [child1 child2] = algorithm.ga.crossover.segment(data, dad, mom, r1, r2);
end

