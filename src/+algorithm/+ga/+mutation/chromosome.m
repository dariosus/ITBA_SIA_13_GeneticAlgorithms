function child = chromosome(data, parent)

    if data.const.pmStar >= rand()

        index = floor(rand() * data.const.numLocus) + 1;

        p = data.const.vec2w(index, :);

        parent{p(1)}(p(2), p(3)) = 2 / sqrt(data.in.arch(p(1) - 1)) * (rand() - 0.5);
    end

    child = parent;
end

