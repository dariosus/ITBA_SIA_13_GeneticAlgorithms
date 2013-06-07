function fitness = evalFitness(data, chromosome, useAllInputs)

    if nargin == 3 && useAllInputs

        S  = data.in.allS;
        Xi = data.in.allXi;
    else
        S  = data.in.S;
        Xi = data.in.Xi;
    end

    error = 0;

    for i = 1 : size(S, 1)

        V = Xi(i, :)';

        for m = 2 : data.in.M

            V = data.fun.g(chromosome.W{m} * [-1; V]);
        end

        error = error + norm(S(i, :)' - V) ^ 2;
    end

    fitness = error / size(S, 1);
end

