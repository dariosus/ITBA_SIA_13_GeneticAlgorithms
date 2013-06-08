function chromosome = evalNetwork(data, chromosome, input)

    chromosome.V{1} = data.in.Xi(input, :)';

    for m = 2 : data.in.M

        chromosome.h{m} = chromosome.W{m} * [-1; chromosome.V{m - 1}];
        chromosome.V{m} = data.fun.g(chromosome.h{m});
    end
end

