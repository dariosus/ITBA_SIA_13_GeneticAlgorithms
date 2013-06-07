function [child1 child2] = spawn(data, population)

    children = data.fun.selection(2, population);

    child1 = children(1);
    child2 = children(2);

    if rand() <= data.const.pc

        [child1 child2] = data.fun.crossover(child1, child2);
    end

    child1 = data.fun.mutation(child1);
    child2 = data.fun.mutation(child2);

    if rand() <= data.const.pb

        % TODO: backpropagation
    end

    child1.fitness = algorithm.ga.chromosome.evalFitness(data, child1);
    child2.fitness = algorithm.ga.chromosome.evalFitness(data, child2);
end

