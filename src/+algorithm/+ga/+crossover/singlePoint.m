function [child1 child2] = singlePoint(data, dad, mom)

    len = size(data.alg.vec2w, 1);
    r1 = floor(rand() * (len - 1)) + 2;

    [child1 child2] = algorithm.ga.crossover.segment(data, dad, mom, r1, len);
end

