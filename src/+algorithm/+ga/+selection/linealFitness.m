function selected = linealFitness(k, population, r)

    F = 0;

    for i = 1 : size(population, 1)

        F = F + population{i}.fitness;
    end

    selected = cell(k, 1);

    r = r * F;

    posR = 1;

    for chromosome = 1 : size(population, 1)

        F = F - population{chromosome}.fitness;

        while posR <= k && r(posR) > F

            selected{posR} = population{chromosome};
            posR = posR + 1;
        end
    end
end

