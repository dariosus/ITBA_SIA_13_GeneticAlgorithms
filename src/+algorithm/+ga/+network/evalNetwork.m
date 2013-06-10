function chromosome = evalNetwork(data, chromosome, input)

    chromosome.V{1} = data.in.Xi(input, :)';

    for m = 2 : data.const.M

        chromosome.h{m} = chromosome.W{m} * [data.const.bias; chromosome.V{m - 1}];

        chromosome.V{m} = data.const.g(chromosome.h{m});
    end

    chromosome.curError = chromosome.curError + norm(data.in.S(input, :)' - chromosome.V{end}) ^ 2;
end

