function [child1 child2] = segment(data, dad, mom, r1, r2)

    if (r1 > r2)

        aux = r1;
        r1 = r2;
        r2 = aux;
    end

    for index = r1 : r2

        p = data.const.linearCoords(index, :);

        aux = dad.W{p(1)}(p(2), p(3));
        dad.W{p(1)}(p(2), p(3)) = mom.W{p(1)}(p(2), p(3));
        mom.W{p(1)}(p(2), p(3)) = aux;
    end

    child1 = dad;
    child2 = mom;
end

