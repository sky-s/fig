cch
nPlots = 20;
nRuns = 4;
x = linspace(pi/2,400);

%% Traditional 'close all' approach.
disp("'close all' approach:")
close all; pause(1)

for iRun = 1:nRuns
    tic
    close all
    for iPlot = 1:nPlots
        figure
        plot(x, sin(iRun*iPlot*x));
    end
    drawnow
    pause(1)
    fprintf('\tTime for run %i: %g\n',iRun,toc-1)
end
    
%% Traditional figure number approach.
disp("Figure number approach:")
close all; pause(1)

for iRun = 1:nRuns
    tic
    for iPlot = 1:nPlots
        figure(iPlot)
        plot(x, sin(iRun*iPlot*x));
    end
    drawnow
    pause(1)
    fprintf('\tTime for run %i: %g\n',iRun,toc-1)
end

%% Using fig.
disp("Using fig:")
close all; pause(1)

for iRun = 1:nRuns
    tic
    for iPlot = 1:nPlots
        fig(string(iPlot))
        plot(x, sin(iRun*iPlot*x));
    end
    drawnow
    pause(1)
    fprintf('\tTime for run %i: %g\n',iRun,toc-1)

end