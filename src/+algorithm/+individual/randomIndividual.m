function individual = randomIndividual(data)

    individual = struct();

    individual.W = cell(data.alg.M, 1); % Weights

    for m = 1 : data.alg.M

        curDim = data.in.arch(m);

        if m > 1

            oldDim = data.in.arch(m - 1) + 1;

            individual.W{m} = 2 / sqrt(oldDim) .* (rand(curDim, oldDim) - 0.5);

            individual.W{m}(:, 1) = data.const.bias;
        end
    end
end

