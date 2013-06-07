function orderedPopulation = orderPopulation(population, order)
    orderedPopulation = sortrows(population, 'fitness', order);
end
