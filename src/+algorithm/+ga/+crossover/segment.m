function [child1 child2] = segment(data, dad, mom, r1, r2)

    if (r1 > r2)

        aux = r1;
        r1 = r2;
        r2 = aux;
    end

    for index = r1 : r2

        [x y z] = data.alg.vec2w(index, :);

        aux = dad{x}(y, z);
        dad{x}(y, z) = mom{x}(y, z);
        mom{x}(y, z) = aux;
    end

    child1 = dad;
    child2 = mom;
end

