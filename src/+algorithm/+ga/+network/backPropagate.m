function chromosome = backPropagate(data, chromosome, input)

    delta = data.fun.dg(chromosome.h{end}) .* (data.in.S(input, :)' - chromosome.V{end});

    for m = data.in.M : -1 : 2

        old = data.alg.momentum * chromosome.dW{m};

        chromosome.dW{m} = old + data.alg.eta * delta * [-1 chromosome.V{m - 1}'];

        % fprintf('h{%d - 1}\n', m);
        % algorithm.debug.print(chromosome.h{m-1});
        % fprintf('W{%d}', m);
        % algorithm.debug.print(chromosome.W{m});
        % fprintf('delta');
        % algorithm.debug.print(delta);
        % fprintf('W{%d}(:, 2:end)" * delta', m);
        % algorithm.debug.print(chromosome.W{m}(:, 2 : end)' * delta);
        % fprintf('dg(h{%d - 1})', m);
        % algorithm.debug.print(data.fun.dg(chromosome.h{m - 1}));

        if m > 2
            delta = data.fun.dg(chromosome.h{m - 1}) .* (chromosome.W{m}(:, 2 : end)' * delta);
        end

        chromosome.W{m} = chromosome.W{m} + chromosome.dW{m};
    end
end

