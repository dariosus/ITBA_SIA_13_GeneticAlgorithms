function runTest(runs, start, params, tests)

    for t = 1: length(tests)

        p = params;

        names = fieldnames(tests{t});
        for i = 1 : length(names)
            p.(names{i}) = tests{t}.(names{i});
        end

        for dirNum = start : start + runs - 1

            dir = strcat('output', num2str(dirNum), '/');

            [success message] = mkdir(dir);

            if isempty(message)

                fprintf(1, 'Running test %d\n', dirNum);

                p.path = dir;

                algorithm.ga.main(p);
            end
        end

        start = start + 10;
    end
end

