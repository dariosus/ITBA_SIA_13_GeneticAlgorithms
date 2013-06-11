function runTests(runs, start, params, tests)

    for test = tests

        p = params;

        names = fieldnames(test{1});
        for i = 1 : length(names)
            p.(names{i}) = test{1}.(names{i});
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

