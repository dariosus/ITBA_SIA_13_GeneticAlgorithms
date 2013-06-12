function child = locus(data, parent)

    for index = 1 : data.const.numLocus

        if rand() < data.alg.pMutate

            p = data.const.linearCoords(index, :);

            parent.W{p(1)}(p(2), p(3)) = algorithm.ga.chromosome.randomAlleles(data, p(1), 1, 1);
        end
    end

    child = parent;
end

