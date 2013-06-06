function data = initializeCoords(data)

    arch = data.in.arch;

    data.alg.vec2w = [];
    data.alg.w2vec = cell(length(arch), 1);

    position = 0;

    for layer = 2 : length(arch)

        data.alg.w2vec{layer} = [];

        for curNeuron = 1 : arch(layer)

            for prevNeuron = 1 : arch(layer - 1) + 1

                position = position + 1;

                data.alg.vec2w = [data.alg.vec2w; layer curNeuron prevNeuron];
                data.alg.w2vec{layer}(curNeuron, prevNeuron) = position;
            end
        end
    end

    data.alg.numLocus = position;
end

