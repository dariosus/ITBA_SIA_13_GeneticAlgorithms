function [child1 child2] = doublePoint(data, dad, mom)

    r1 = floor(rand() * data.const.numLocus) + 1;
    r2 = floor(rand() * (data.const.numLocus - r1 + (r1 ~= 1)) + r1;

    [child1 child2] = algorithm.ga.crossover.segment(data, dad, mom, r1, r2);
end

