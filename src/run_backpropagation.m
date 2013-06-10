R = 3;

i=380;for j=1:R; i=i+1;params=struct('path', strcat('output',num2str(i),'/'), 'pBack', 0);algorithm.ga.main(params);end

