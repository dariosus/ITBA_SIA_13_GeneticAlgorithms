function goAway = ready(data)

    best = min(data.debug.sampleBest(end - data.const.contentGenerations : end));

    old = sort(data.debug.fitness);
    new = sort([data.alg.population.fitness]);

    if data.alg.generation >= data.const.maxGenerations

        fprintf('Reached max generation\n');
        goAway = true;

    elseif min([data.alg.population]) <= data.const.targetFitness

        fprintf('Reached target fitness\n');
        goAway = true;

    elseif data.debug.sampleBest(end - data.const.contentGenerations) == best

        fprintf('Best fitness unchanged for too much generations\n');
        goAway = true;

    elseif blabla

        fprintf('Population didn''t change for a while\n');
        goAway = true;

    else
        goAway = false;
    end
end

