function linearCoords = linearCoords(data)

    linearCoords = [];

    for layer = 2 : data.const.M

        for curNeuron = 1 : data.const.arch(layer)

            for prevNeuron = 1 : data.const.arch(layer - 1) + 1

                linearCoords = [linearCoords; layer curNeuron prevNeuron];
            end
        end
    end
end

