function [data children] = spawn(data, children)

    for c = 2 : 2 : numel(children)

        if rand() <= data.const.pCross

            [c1 c2] = data.const.crossover(data, children(c - 1), children(c));

            children(c - 1 : c) = [c1 c2];

            data.alg.crossovers = data.alg.crossovers + 1;
        end
    end

    for c = 1 : numel(children)

        child = data.const.mutation(data, children(c));

        if ismember(false, cellfun(@(x,y)ismember(false, x == y)), child.W, children(c).W))

            children(c) = child;

            data.alg.mutations = data.alg.mutations + 1;
        end

        if rand() <= data.const.pBack

            children(c) = algorithm.ga.network.main(data, children(c));

            data.alg.backpropagations = data.alg.backpropagations + 1;
        end

        children(c).fitness = algorithm.ga.chromosome.evalFitness(data, child1);
    end
end

