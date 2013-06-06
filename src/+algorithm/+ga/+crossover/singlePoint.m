function [child1 child2] = singlePoint(data, dad, mom)

    r1 = floor(rand() * (data.const.numLocus - 1)) + 2;
    r2 = data.const.numLocus;

    [child1 child2] = algorithm.ga.crossover.segment(data, dad, mom, r1, r2);
end

