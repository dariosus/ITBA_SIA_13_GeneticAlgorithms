function [child1 child2] = uniform(data, dad, mom)

    for index = 1 : data.const.numLocus

        if data.const.p >= rand()

            p = data.const.vec2w(index, :);

            aux = dad.W{p(1)}(p(2), p(3));
            dad.W{p(1)}(p(2), p(3)) = mom.W{p(1)}(p(2), p(3));
            mom.W{p(1)}(p(2), p(3)) = aux;
        end
    end

    child1 = dad;
    child2 = mom;
end

