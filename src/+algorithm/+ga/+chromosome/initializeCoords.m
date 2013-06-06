function data = initializeCoords(data)

    arch = data.in.arch;

    data.const.vec2w = [];
    data.const.w2vec = cell(length(arch), 1);

    position = 0;

    for layer = 2 : length(arch)

        data.const.w2vec{layer} = [];

        for curNeuron = 1 : arch(layer)

            for prevNeuron = 1 : arch(layer - 1) + 1

                position = position + 1;

                data.const.vec2w = [data.const.vec2w; layer curNeuron prevNeuron];
                data.const.w2vec{layer}(curNeuron, prevNeuron) = position;
            end
        end
    end

    data.const.numLocus = position;
end

