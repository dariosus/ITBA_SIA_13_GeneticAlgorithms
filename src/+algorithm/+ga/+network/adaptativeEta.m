function chromosome = adaptativeEta(data, chromosome)

    error = chromosome.curError / size(data.in.Xi, 1);

rollback = false;
    if isfield(chromosome, 'oldError')

        delta = error - chromosome.oldError;

        if delta < -data.const.etaEps

            chromosome.goodSteps = chromosome.goodSteps + 1;
            chromosome.debug.goodSteps = chromosome.debug.goodSteps + 1;

            if chromosome.goodSteps >= data.const.etaSteps

                chromosome.goodSteps = 0;
                chromosome.eta = chromosome.eta + data.const.etaInc;
            end

        elseif delta > data.const.etaEps

            chromosome.goodSteps = 0;
            chromosome.eta = chromosome.eta * (1 - data.const.etaDec);

            if data.const.rollback

rollback = true;
                error = chromosome.oldError;
                chromosome.W = chromosome.oldW;
                chromosome.debug.rollbacks = chromosome.debug.rollbacks + 1;
            end

        else

            chromosome.goodSteps = 0;
        end
    end

    chromosome.oldW = chromosome.W;
    chromosome.oldError = error;
    chromosome.curError = 0;

    %%%
    %% Debug
    %%%

if ~rollback
    chromosome.debug.cummGoodSteps = [chromosome.debug.cummGoodSteps chromosome.debug.goodSteps];
    chromosome.debug.cummRollbacks = [chromosome.debug.cummRollbacks chromosome.debug.rollbacks];
    chromosome.debug.etas = [chromosome.debug.etas chromosome.eta];
    chromosome.debug.errors = [chromosome.debug.errors error];
end
end

