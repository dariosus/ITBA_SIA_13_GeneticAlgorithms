function child = chromosome(data, parent)

    if data.const.pmStar >= rand()

        index = floor(rand() * data.const.numLocus) + 1;

        [x y z] = data.const.vec2w(index, :);

        parent{x}(y, z) = 2 / sqrt(data.in.arch(x - 1)) * (rand() - 0.5);
    end

    child = parent;
end

