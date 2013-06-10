R = 3;

% i=50;for j=1:R; i=i+1;params=struct('path', strcat('output',num2str(i),'/'), 'mutation', @algorithm.ga.mutation.chromosome);algorithm.ga.main(params);end
% i=60;for j=1:R; i=i+1;params=struct('path', strcat('output',num2str(i),'/'), 'mutation', @algorithm.ga.mutation.locus);algorithm.ga.main(params);end
i=150;for j=1:R; i=i+1;params=struct('path', strcat('output',num2str(i),'/'), 'nonUniformMutation', true, 'mutation', @algorithm.ga.mutation.chromosome);algorithm.ga.main(params);end
i=160;for j=1:R; i=i+1;params=struct('path', strcat('output',num2str(i),'/'), 'nonUniformMutation', true, 'mutation', @algorithm.ga.mutation.locus);algorithm.ga.main(params);end

