function main(params)

    data = algorithm.ga.initialize(params);

    algorithm.debug.printStruct(data);
    % algorithm.debug.printStruct(algorithm.ga.selection.roulette(5, data.alg.population));
%
%     while ~algorithm.ready(data)
%
%         data.alg.generation = data.alg.generation + 1;
%
%         data = algorithm.its_a_new_generation(data);
%     end
%
    % algorithm.oh_yeah(data);
end

