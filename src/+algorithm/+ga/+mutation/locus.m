function child = locus(data, parent)

    for index = 1 : data.const.numLocus

        if data.const.pMutate >= rand()

            p = data.const.vec2w(index, :);

            parent.W{p(1)}(p(2), p(3)) = algorithm.ga.chromosome.randomAlleles(data, p(1), 1, 1);
        end
    end

    child = parent;
end

