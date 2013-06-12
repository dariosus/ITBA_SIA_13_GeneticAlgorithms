function selected = linealFitness(k, values, r, unique)

    if unique
        [v sort2val] = sort(values);

        val2sort = [];
        for i = 1 : numel(values)
            val2sort(sort2val(i)) = i;
        end
    end

    temp = [1 : 2 * numel(values) - 1];

    interleave = [floor(temp / 2) .* ((-1) .^ temp) inf];

    F = sum(values);

    r = sort(r, 'descend') * F;

    selected = [1 : k]';

    rpos = 1;

    for i = 1 : numel(values)

        F = F - values(i);

        while rpos <= k && r(rpos) > F

            for delta = interleave

                if ~unique || isinf(delta)

                    selected(rpos) = i;
                    break;
                end

                desp = val2sort(i) + delta;

                if desp < i || desp > numel(values)

                    continue;
                end

                pos = sort2val(desp);

                if ~ismember(pos, selected)

                    selected(rpos) = pos;
                    break;
                end
            end

            rpos = rpos + 1;
        end
    end
end

