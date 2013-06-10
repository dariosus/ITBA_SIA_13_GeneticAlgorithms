function [data population] = first(data)

    [data population] = algorithm.ga.replacement.populate(data, data.const.N);
end

