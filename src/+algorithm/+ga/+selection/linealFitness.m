function selected = linealFitness(k, population, r)

    F = 0;

    for i = 1 : size(population, 1)

        F = F + population{i}.fitness;
    end

    selected = [];

    r = r * F;

    rpos = 1;

    for chromosome = 1 : size(population, 1)

        F = F - population{chromosome}.fitness;

        while rpos <= k && r(rpos) > F

            selected = [selected population{chromosome}];
            rpos = rpos + 1;
        end
    end
end

