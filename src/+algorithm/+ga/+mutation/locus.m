function child = locus(data, parent)

    for index = 1 : data.const.numLocus

        if data.const.pm >= rand()

            p = data.const.vec2w(index, :);

            parent.W{p(1)}(p(2), p(3)) = 2 / sqrt(data.in.arch(p(1) - 1)) * (rand() - 0.5);
        end
    end

    child = parent;
end

