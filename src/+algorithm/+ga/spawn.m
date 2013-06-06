function [child1 child2] = spawn(data, population)

    [child1 child2] = data.fun.selection(2, population);

    if rand() <= data.const.pc

        [child1 child2] = data.fun.crossover(child1, child2);
    end

    child1 = data.fun.mutation(child1);
    child2 = data.fun.mutation(child2);

    if rand() <= data.const.pb

        % TODO: backpropagation
    end

    child1.fitness = evalFitness(data, child1);
    child2.fitness = evalFitness(data, child2);
end

