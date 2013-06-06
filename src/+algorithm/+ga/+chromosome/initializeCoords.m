function data = initializeCoords(data)

    data.const.vec2w = [];
    data.const.w2vec = cell(data.in.M, 1);

    position = 0;

    for layer = 2 : data.in.M

        data.const.w2vec{layer} = [];

        for curNeuron = 1 : data.in.arch(layer)

            for prevNeuron = 1 : data.in.arch(layer - 1) + 1

                position = position + 1;

                data.const.vec2w = [data.const.vec2w; layer curNeuron prevNeuron];
                data.const.w2vec{layer}(curNeuron, prevNeuron) = position;
            end
        end
    end

    data.const.numLocus = position;
end

