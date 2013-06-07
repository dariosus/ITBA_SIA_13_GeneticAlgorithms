function selected = tourney(k, population)

    selected = [];

    for iter = 1 : k

        chromosome1 = population{floor(rand() * size(population, 1)) + 1};
        chromosome2 = population{floor(rand() * size(population, 1)) + 1};

        if (chromosome1.fitness > chromosome2.fitness)
            bestChromosome = chromosome1;
            worstChromosome = chromosome2;
        else
            bestChromosome = chromosome2;
            worstChromosome = chromosome1;
        end

        if (rand() >= 0.75)
            selected = [selected worstChromosome];
        else
            selected = [selected bestChromosome];
        end

    end

end
