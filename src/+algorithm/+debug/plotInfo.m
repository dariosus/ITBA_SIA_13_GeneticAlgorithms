function plotInfo(plots, name)

    clf();

    hold on;

    ret = [];
    msg = {};

    colors = {'b', 'g', 'r', 'k'};

    for i = 1 : length(plots)

        if ~isempty(plots{i}{1})

            ret = [ret plot(plots{i}{1}, colors{i})];
            msg = [msg {plots{i}{2}}];
        end
    end

    legend(ret, msg);

    hold off;

    drawnow('expose');

    print(gcf, strcat(name, '.png'),'-dpng');

    set(gcf, 'visible', 'off');
end

