function print(data, file)

    function print2(str, data)

        len = numel(data);

        if strcmp(class(data), 'cell')

            arrayfun(...
                @(pos) print2(strcat(str, '{', num2str(pos), '}'), data{pos}),...
                [1 : len]...
            );

        elseif strcmp(class(data), 'struct') && len == 1

            cellfun(...
                @(name) print2(strcat(str, '.', name), data.(name)),...
                fieldnames(data)...
            );

        elseif strcmp(class(data), 'struct')

            arrayfun(...
                @(struct, pos) print2(strcat(str, '(', num2str(pos), ')'), data(pos)),...
                data,...
                reshape([1 : len], size(data))...
            );

        elseif len == 0

            fprintf(file, '%s = [empty]\n', str);

        elseif len == 1

            fprintf(file, '%s = %s', str, evalc('disp(data)'));

        elseif len < 50

            fprintf(file, '%s =\n', str, evalc('printmat(data)'));

        else

            dim = '';

            for n = size(data)
                if n > 10
                    dim = strcat(dim, 'end - 9 : end,');
                else
                    dim = strcat(dim, ':,');
                end
            end

            fprintf(file, '%s = [...] -> %s\n', str, mat2str(size(data)));
            fprintf(file, '%s', evalc(strcat('printmat(data(', dim(1 : end - 1), '));')));
        end
    end

    if nargin < 2
        file = 1;
    end

    fprintf(file, '\n');

    print2('', data);
end

