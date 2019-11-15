% Compare the speed of various schemes for figure window management, including
% combinations of options for fig.
% 
%   See also fig.

close all
home
nPlots = 20;
nRuns = 4;
x = linspace(0,pi/2,400);

%% Traditional 'close all' approach.
disp("'close all' approach:")
close all; pause(5)

for iRun = 1:nRuns
    tic
    close all
    for iPlot = 1:nPlots
        figure
        plot(x, sin(iRun*iPlot*x));
    end
    drawnow
    pause(5)
    fprintf('\tTime for run %i: %g\n',iRun,toc-5)
end
    
%% Traditional figure number approach.
disp("Figure number approach:")
close all; pause(5)

for iRun = 1:nRuns
    tic
    for iPlot = 1:nPlots
        figure(iPlot)
        plot(x, sin(iRun*iPlot*x));
    end
    drawnow
    pause(5)
    fprintf('\tTime for run %i: %g\n',iRun,toc-5)
end

%% Using fig.
disp("Using fig:")
close all; pause(5)

for iRun = 1:nRuns
    tic
    for iPlot = 1:nPlots
        fig(string(iPlot))
        plot(x, sin(iRun*iPlot*x));
    end
    drawnow
    pause(5)
    fprintf('\tTime for run %i: %g\n',iRun,toc-5)

end

%% Using fig with '-raise' option
disp("Using fig with '-raise' option:")
close all; pause(5)

for iRun = 1:nRuns
    tic
    for iPlot = 1:nPlots
        fig(string(iPlot),'-raise')
        plot(x, sin(iRun*iPlot*x));
    end
    drawnow
    pause(5)
    fprintf('\tTime for run %i: %g\n',iRun,toc-5)

end

%% Using fig with '-raise' option
disp("Using fig with '-reset' option:")
close all; pause(5)

for iRun = 1:nRuns
    tic
    for iPlot = 1:nPlots
        fig(string(iPlot),'-reset')
        plot(x, sin(iRun*iPlot*x));
    end
    drawnow
    pause(5)
    fprintf('\tTime for run %i: %g\n',iRun,toc-5)

end

%% Using fig with '-raise' and '-reset' options
disp("Using fig with '-raise' and '-reset' options:")
close all; pause(5)

for iRun = 1:nRuns
    tic
    for iPlot = 1:nPlots
        fig(string(iPlot),'-raise','-reset')
        plot(x, sin(iRun*iPlot*x));
    end
    drawnow
    pause(5)
    fprintf('\tTime for run %i: %g\n',iRun,toc-5)

end