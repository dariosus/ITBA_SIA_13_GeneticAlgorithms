function chromosome = backPropagate(data, chromosome, input)

    delta = cell(data.const.M, 1);

    delta{end} = data.const.dg(chromosome.h{end}) .* (data.in.S(input, :)' - chromosome.V{end});

    for m = data.const.M - 1 : -1 : 2

        delta{m} = data.const.dg(chromosome.h{m}) .* (chromosome.W{m + 1}(:, 2 : end)' * delta{m + 1});
    end

    for m = data.const.M : -1 : 2

        inertia = data.const.momentum * chromosome.dW{m};

        chromosome.dW{m} = inertia + chromosome.eta * delta{m} * [data.const.bias chromosome.V{m - 1}'];

        chromosome.W{m} = chromosome.W{m} + chromosome.dW{m};
    end
end

