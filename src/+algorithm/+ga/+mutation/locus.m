function child = locus(data, parent)

    for index = 1 : data.alg.numLocus

        if data.const.pm >= rand()

            [x y z] = data.const.vec2w(index, :);

            parent{x}(y, z) = 2 / sqrt(data.in.arch(x - 1)) * (rand() - 0.5);
        end
    end

    child = parent;
end

