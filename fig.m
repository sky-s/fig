function h_ = fig(name,varargin)
% fig  Manage figure windows by name and prevent figure window clutter.
% 
%   Use fig as you would the figure function, but with a meaningful name as the
%   argument instead of an integer. This will help organize figure windows,
%   prevent unnecessary clutter caused by creating new figure windows with every
%   run of code, and speed up repeated runs.
% 
%   fig, by itself, creates a new figure window and returns its handle.
%   
%   fig(name) makes the figure with the specified name the current figure. If
%   multiple existing figure windows match the name, the first one returned by
%   findobj is used. If a figure with that name does not exist, a new figure is
%   created with that name.
% 
%   By default, the specified figure is made the current figure without forcing
%   it to become visible and raised above other figures. This can be especially
%   useful when debugging or tweaking a specific plot in a code. To get behavior
%   more similar to the figure function, use the '-raise' argument to force the
%   figure to become visible and raise it above all other figures on the screen.
% 
%   The '-reset' argument makes it so that when switching to an existing figure,
%   that figure is cleared (using the harder 'reset' argument for clf) such that
%   it is like a newly-created figure window. This is useful in cases when the
%   hold state may be 'on', for example.
% 
%   Additional arguments are passed to the figure function.
% 
%   Both the '-raise' argument and the '-reset' argument add extra steps that
%   slow things down. By default, however, using fig can be noticeably faster
%   than traditional figure window management schemes such as closing all
%   windows at the beginning of every script or calling the figure function with
%   integer arguments.
%
%   Example (run this multiple times to further illustrate utility of fig):
%     fig sine
%     ezplot(@sin)
% 
%     % Switch to new named figure window.
%     fig('waves','-reset','Color','w')
%     ezplot(@sin);
%     hold on % Using -reset argument because of hold state.
%     ezplot(@cos)
% 
%     % Switch to first window using meaningful name.
%     fig sine
%     line % Draw tangent line.
%
%   See also figure, clf, findobj, close, cch, gcf, set.

% Copyright (c), Sky Sartorius. All rights reserved.
% Contact: www.mathworks.com/matlabcentral/fileexchange/authors/101715

% Here you can customize with some preferred figure property defaults.
% defaultsFigureArgs = {'Color','w','Units','inches'}; % Example defaults.
defaultsFigureArgs = {};

if nargin
    % Parse flags.
    keywords = {'reset' 'raise'};
    for i = 1:numel(keywords)
        kwInd = strcmpi(varargin,['-' keywords{i}]);
        flags.(keywords{i}) = any(kwInd);
        varargin = varargin(~kwInd);
    end
    
    h = findobj('Type','figure','Name',name);
    props = {'Name',name,'NumberTitle','off'};
    if isempty(h) % Does not exist; create new.
        h = figure(props{:},defaultsFigureArgs{:},varargin{:});
    else
        h = h(1); % In case multiple matches.
        if flags.reset
            clf(h,'reset');
        end
        
        set(h,props{:},defaultsFigureArgs{:},varargin{:});
        
        if flags.raise
            figure(h);
        else
            set(0,'CurrentFigure',h);
        end
    end
    
else
    h = figure(defaultsFigureArgs{:});
end

if nargout
    h_ = h;
end