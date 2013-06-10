function ready = finish(data)

    if data.alg.generation > data.const.maxGenerations

        fprintf('Reached max generation\n');
        ready = true;
        return
    end

    if max([data.alg.population.fitness]) >= 1 / data.const.targetError

        fprintf('Reached target fitness\n');
        ready = true;
        return
    end

    if algorithm.ga.finish.content(data)

        fprintf('Best fitness unchanged for too much generations\n');
        ready = true;
        return
    end

    if algorithm.ga.finish.structure(data)

        fprintf('Population didn''t change significantly\n');
        ready = true;
        return
    end

    ready = false;
end

