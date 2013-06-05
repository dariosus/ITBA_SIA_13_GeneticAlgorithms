function chromosome = evalFitness(data, chromosome, useAllInputs)

    if nargin == 3 && useAllInputs

        S  = data.in.allS;
        Xi = data.in.allXi;
    else
        S  = data.in.S;
        Xi = data.in.Xi;
    end

    errors = [];

    for i = 1 : size(S, 1)

        V = [-1; Xi(i, :)'];

        for m = 2 : data.alg.M

            V = [-1; data.fun.g(chromosome.W{m} * V)];
        end

        error = abs(norm(S(i, :)' - V(2 : end)));

        errors = [errors error];
    end

    chromosome.fitness = mean(errors .^ 2);
end

