function dumpNetwork(data, chromosome)

    global prepend;

    prepend = [prepend 1];

    pos = num2str(numel(prepend));

    %%%
    %% Print chromosome struct to file (human readable)
    %%%

    f = fopen(strcat(data.const.path, pos, '_output.txt'), 'w');
    algorithm.debug.print(chromosome, f);
    fclose(f);

    %%%
    %% Generate and save plots
    %%%

    algorithm.debug.plotInfo(...
        {
            {chromosome.debug.errors, 'mean sqared errors for training samples'},
        },...
        strcat(data.const.path, pos, '_error')...
    );

    algorithm.debug.plotInfo(...
        {
            {chromosome.debug.cumRollbacks, 'accumulated rollbacks'},
        },...
        strcat(data.const.path, pos, '_rollback')...
    );

    algorithm.debug.plotInfo(...
        {
            {chromosome.debug.cumGoodSteps, 'accumulated good steps'},
        },...
        strcat(data.const.path, pos, '_good')...
    );

    algorithm.debug.plotInfo(...
        {
            {chromosome.debug.etas, 'eta value'},
        },...
        strcat(data.const.path, pos, '_eta')...
    );
end

