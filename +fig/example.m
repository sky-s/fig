% Example (run this multiple times to further illustrate utility of fig).

fig sine
ezplot(@sin)

% Switch to new named figure window.
fig('waves','-reset','Color','w')
ezplot(@sin);
hold on % Using -reset argument because of hold state.
ezplot(@cos)

% Switch to first window using meaningful name.
fig sine
line % Draw tangent line.