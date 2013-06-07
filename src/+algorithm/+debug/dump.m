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

    % algorithm.debug.plotInfo(...
    %     {
    %         {data.info.sampleErrors, 'mean sqared error for training sample'},
    %         {data.info.globalErrors, 'mean sqared error for all samples'},
    %     },...
    %     strcat(data.const.path, 'error_', run)...
    % );
end

