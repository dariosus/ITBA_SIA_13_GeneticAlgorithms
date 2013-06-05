function individual = evalFitness(data, individual, useAllInputs)

    if nargin == 3 && useAllInputs

        S  = data.alg.allS
        Xi = data.alg.allXi
    else
        S  = data.alg.S
        Xi = data.alg.Xi
    end

    errors = [];

    for i = 1 : size(S, 1)

        V = [-1; Xi(i, :)'];

        for m = 2 : data.alg.M

            V = [-1; data.fun.g(individual.W{m} * V);
        end

        errors = [errors abs(norm(S(i, :)' - V(2 : end)))];
    end

    individual.fitness = mean(errors .^ 2);
end

