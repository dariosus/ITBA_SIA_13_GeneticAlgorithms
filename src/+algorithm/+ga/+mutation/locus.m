function child = locus(data, parent)

    for index = 1 : data.alg.numLocus

        if data.const.pm >= rand()

            [x y z] = data.alg.vec2w(index, :);

            % parent{x}(y, z) = ;
        end
    end

    child = parent;
end

