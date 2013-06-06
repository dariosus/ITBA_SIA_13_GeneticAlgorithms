function [child1 child2] = uniform(data, dad, mom)

    for index = 1 : data.const.numLocus

        if data.const.p >= rand()

            [x y z] = data.const.vec2w(index, :);

            aux = dad{x}(y, z);
            dad{x}(y, z) = mom{x}(y, z);
            mom{x}(y, z) = aux;
        end
    end

    child1 = dad;
    child2 = mom;
end

