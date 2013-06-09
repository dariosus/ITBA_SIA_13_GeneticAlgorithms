function selected = linealFitness(k, values, r)

    F = sum(values);

    r = sort(r, 'descend') * F;

    selected = [1 : k]';

    rpos = 1;

    for i = 1 : numel(values)

        F = F - values(i);

        while rpos <= k && r(rpos) > F

            selected(rpos) = i;

            rpos = rpos + 1;
        end
    end
end

