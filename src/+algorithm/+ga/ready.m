function goAway = ready(data)

    best = min(data.debug.sampleBest(end - data.const.contentGenerations : end));

    old = sort(data.debug.fitness);
    new = sort([data.alg.population.fitness]);

    count = 0;
    indexNew = 1;

    for indexOld = 1 : data.const.N

        while indexNew <= data.const.N && old(indexOld) >= new(indexNew)

            count = count + (old(indexOld) == new(indexNew));

            indexNew = indexNew + 1;
        end
    end

    if data.alg.generation >= data.const.maxGenerations

        fprintf('Reached max generation\n');
        goAway = true;

    elseif min([data.alg.population]) <= data.const.targetFitness

        fprintf('Reached target fitness\n');
        goAway = true;

    elseif data.debug.sampleBest(end - data.const.contentGenerations) == best

        fprintf('Best fitness unchanged for too much generations\n');
        goAway = true;

    elseif count / data.const.N >= data.const.changeRatio

        fprintf('Population didn''t change for a while\n');
        goAway = true;

    else

        goAway = false;
    end
end

