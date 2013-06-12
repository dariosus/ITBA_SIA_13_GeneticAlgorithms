function printResults(name)

    [runs start params tests] = eval(strcat('test.', name, '()'));

    fprintf(1, '%20s | avgMeanErrors | avgBestErrors | bestMeanErrors | bestBestErrors\n', 'Method');
    fprintf(1, '%s\n', repmat('-', 1, 86));

    for t = 1: length(tests)

        avg = [];
        best = [];

        finish = start + 9 - mod(start, 10);

        for dirNum = start : finish

            try
                load(strcat('output', num2str(dirNum), '/data_0.mat'), '-mat', 'data');

                avg = [avg data.debug.sampleErrors(end)];
                best = [best data.debug.sampleBest(end)];
            catch
            end
        end

        start = start + 10;

        if ~isempty(avg)
            fprintf(1, '%20s | %13f | %13f | %14f | %14f\n', tests{t}.name, mean(avg), mean(best), min(avg), min(best));
        end
    end
end

