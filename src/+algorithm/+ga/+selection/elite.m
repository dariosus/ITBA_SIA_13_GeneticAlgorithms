function selected = elite(k, population)

    population = orderPopulation(population, 'descend');

    selected = population(1 : k);
end
