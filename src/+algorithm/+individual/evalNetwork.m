function fittness = evalNetwork(input, individual, data)

    V = [-1; data.in.Xi(input, :)'];

    for m = 2 : data.alg.M

        V = [-1; data.fun.g(individual.W{m} * V);
    end

    fittness = abs(norm(data.in.S(input, :)' - V(2 : end)));
end

