function ready = structure(data)

    if data.alg.generation == 1

        ready = false;
        return
    end

    old = sort(data.alg.lastFitness);
    new = sort([data.alg.population.fitness]);

    count = 0;
    indexNew = 1;

    for indexOld = 1 : data.const.N

        while indexNew <= data.const.N && old(indexOld) >= new(indexNew)

            count = count + (old(indexOld) == new(indexNew));

            indexNew = indexNew + 1;
        end
    end

    ready = count / data.const.N >= data.const.changeRatio;
end

