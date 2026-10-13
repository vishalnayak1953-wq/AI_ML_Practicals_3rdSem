% Practical 6: Breadth-First Search (BFS) for an unweighted graph
% BFS finds a path with the fewest edges.
% Prolog dialect: SWI-Prolog
%
% Example query:
% ?- bfs_path(s, g, Path).

% Undirected graph, represented once per edge.
bfs_edge(s, a).
bfs_edge(s, b).
bfs_edge(a, c).
bfs_edge(a, d).
bfs_edge(b, d).
bfs_edge(b, e).
bfs_edge(c, g).
bfs_edge(d, g).
bfs_edge(e, g).

bfs_connected(X, Y) :- bfs_edge(X, Y).
bfs_connected(X, Y) :- bfs_edge(Y, X).

bfs_path(Start, Goal, Path) :-
    bfs_queue([[Start]], Goal, ReversePath),
    reverse(ReversePath, Path).

bfs_queue([[Goal | Previous] | _], Goal, [Goal | Previous]) :- !.
bfs_queue([[Current | Previous] | Queue], Goal, Path) :-
    findall([Next, Current | Previous],
            ( bfs_connected(Current, Next),
              \+ memberchk(Next, [Current | Previous])
            ),
            NewPaths),
    append(Queue, NewPaths, NewQueue),
    bfs_queue(NewQueue, Goal, Path).
