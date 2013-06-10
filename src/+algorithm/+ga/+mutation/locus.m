function [data child] = locus(data, parent)

    mutated = false;

    for index = 1 : data.const.numLocus

        if data.alg.pMutate >= rand()

            p = data.const.linearCoords(index, :);

            parent.W{p(1)}(p(2), p(3)) = algorithm.ga.chromosome.randomAlleles(data, p(1), 1, 1);

            mutated = true;
        end
    end

    child = parent;

    data.alg.mutation = data.alg.mutation + mutated;
end

