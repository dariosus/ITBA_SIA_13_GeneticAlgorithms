start = 500;

tests = {
    'elite',
    'roulette',
    'tourney',
    'rank',
    'boltzmann(f=1)',
    'boltzmann(f=0.5)',
    'boltzmann(f=0.1)',
    'universal',
    'mixed1(a = 0.1)',
    'mixed1(a = 0.2)',
    'mixed2(a = 0.1)',
    'mixed2(a = 0.2)'
};

test.printResults(start, tests);

