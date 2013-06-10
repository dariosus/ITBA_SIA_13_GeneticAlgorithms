function alleles = randomAlleles(data, layer, rows, cols)

    alleles = 2 / sqrt(data.const.arch(layer - 1) + 1) * (rand(rows, cols) - 0.5);
end

