function population = roulette(k, oldPopulation)

    F = 0;

    for i = 1 : size(oldPopulation, 1)

        F = F + oldPopulation{i}.fitness
    end

    population = cell(k, 1);

    r = sort(rand(k, 1) * F, 'descend')

    curR = 1;

    for chromosome = 1 : size(oldPopulation, 1)

        F = F - oldPopulation{chromosome}.fitness

        while curR <= k && r(curR) > F

            population{curR} = oldPopulation{chromosome};
            curR = curR + 1
        end
    end
end

