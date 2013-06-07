function dump(data)

    run = int2str(data.alg.generation / data.const.generationsPerDump);

    %%%
    %% Print data struct to file (human readable)
    %%%

    f = fopen(strcat(data.const.path, 'output_', run, '.txt'), 'w');
    algorithm.debug.print(data, f);
    fclose(f);

    %%%
    %% Save data struct to file (matlab readable)
    %%%

    save(strcat(data.const.path, 'data_', run, '.mat'), 'data', '-v7', '-mat');

    %%%
    %% Generate and save plots
    %%%

    algorithm.debug.plotInfo(...
        {
            {data.debug.sampleErrors, 'mean sqared errors for training samples'},
            {data.debug.globalErrors, 'mean sqared errors for all samples'},
        },...
        strcat(data.const.path, 'error_', run)...
    );

    algorithm.debug.plotInfo(...
        {
            {data.debug.sampleBest, 'best mean sqared error for training samples'},
            {data.debug.globalBest, 'best mean sqared error for all samples'},
        },...
        strcat(data.const.path, 'best_', run)...
    );

    algorithm.debug.plotInfo(...
        {
            {data.debug.sampleStd, 'std of mean sqared errors for training samples'},
            {data.debug.globalStd, 'std of mean sqared errors for all samples'},
        },...
        strcat(data.const.path, 'std_', run)...
    );
end

