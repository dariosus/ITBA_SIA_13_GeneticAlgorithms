function child = chromosome(data, parent)

    if data.const.pmStar >= rand()

        index = floor(rand() * data.const.numLocus) + 1;

        [x y z] = data.alg.vec2w(index, :);

        % parent{x}(y, z) = ;
    end

    child = parent;
end

