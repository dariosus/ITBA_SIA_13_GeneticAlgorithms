function [child1 child2] = annular(data, dad, mom)

    len = size(data.alg.vec2w, 1);

    r1 = floor(rand() * len) + 1;
    l = floor(rand() * len / 2);
    r2 = mod(r1 + l - 1, len) + 1;

    [child1 child2] = algorithm.ga.crossover.segment(data, dad, mom, r1, r2);
end

