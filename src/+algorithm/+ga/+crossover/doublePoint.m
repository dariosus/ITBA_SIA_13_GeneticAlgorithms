function [child1 child2] = doublePoint(data, dad, mom)

    len = size(data.alg.vec2w, 1);

    r1 = floor(rand() * len) + 1;
    r2 = floor(rand() * (len - r1 + (r1 ~= 1)) + r1;

    [child1 child2] = algorithm.ga.crossover.segment(data, dad, mom, r1, r2);
end

