function population = unique(data, population, pool)

    for time = 1 : data.const.uniqueTries

        [values indexes] = sort([population.fitness]);

        equals = [];

        for i = 2 : data.const.N

            if values(i - 1) == values(i)

                equals = [equals indexes(i)];
            end
        end

        if isempty(equals)

            break;
        end

        population(equals) = data.fun.selection(numel(equal), pool);
    end
end

