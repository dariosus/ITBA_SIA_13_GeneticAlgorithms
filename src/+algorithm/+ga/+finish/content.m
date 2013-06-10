function ready = content(data)

    pos = data.alg.generation - data.const.contentGenerations;

    ready = pos > 0 && data.debug.sampleBest(pos) == min(data.debug.sampleBest(pos : end));
end

