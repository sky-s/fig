function h_ = fig(name,varargin)
% fig  Manage figure windows by name and prevent figure window clutter.
% 
%   fig, by itself, creates a new figure window and returns its handle.
%   
%   fig(name) makes the figure with the specified name the current figure,
%   forces it to become visible, and raises it above all other figures on the
%   screen. If multiple existing figure windows match the name, the first one
%   returned by findobj is used. If a figure with that name does not exist, a
%   new figure is created with that name.
% 
%   When switching to an existing figure, that figure is cleared using the
%   harder 'reset' argument for clf such that it is like a newly-created figure
%   window. To avoid this and have behavior more similar to switching windows
%   using the figure function, use the '-noreset' argument.
% 
%   The '-silent' argument will make the specified existing named figure the
%   current figure without forcing it to become visible and raised above other
%   figures.
%
%   Additional arguments are passed to the figure function.
% 
%   Example (run this multiple times to further illustrate utility of fig):
%       fig sine % Create new named figure window.
%       ezplot(@sin)
% 
%       % Create new named figure window (or silently make existing figure
%       % window current).
%       fig('waves','-silent','Color','w')
%       ezplot(@sin);
%       hold on
%       ezplot(@cos)
% 
%       % Switch to first window using meaningful name; do not clear figure.
%       fig sine -noreset
%       line % Draw tangent line.
%
%   See also figure, clf, findobj, close, cch, gcf, set.

% Copyright (c), Sky Sartorius. All rights reserved.
% Contact: www.mathworks.com/matlabcentral/fileexchange/authors/101715

% Here you can customize with some preferred figure property defaults.
% defaults = {'Color','w','Units','inches'}; % Example defaults.
defaultsFigureArgs = {}; 

if nargin
    % Parse flags.
    keywords = {'silent' 'noreset'};
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
        if ~flags.noreset
            clf(h,'reset');
        end
        
        set(h,props{:},defaultsFigureArgs{:},varargin{:});
        
        if flags.silent
            set(0,'CurrentFigure',h);
        else
            figure(h);
        end
    end
    
else
    h = figure(defaultsFigureArgs{:});
end

if nargout
    h_ = h;
end