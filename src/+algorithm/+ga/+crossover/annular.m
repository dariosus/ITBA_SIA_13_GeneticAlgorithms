function [child1 child2] = annular(data, dad, mom)

    r1 = floor(rand() * data.const.numLocus) + 1;
    l  = floor(rand() * data.const.numLocus / 2);
    r2 = mod(r1 + l - 1, data.const.numLocus) + 1;

    [child1 child2] = algorithm.ga.crossover.segment(data, dad, mom, r1, r2);
end

