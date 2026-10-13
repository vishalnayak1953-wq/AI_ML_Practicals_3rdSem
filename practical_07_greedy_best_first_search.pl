% Practical 7: Greedy Best-First Search using a heuristic
% The search expands the frontier node with the smallest h(n).
% Note: Greedy Best-First Search is not guaranteed to return the cheapest path.
%
% Example query:
% ?- greedy_best_first(s, g, Path).

% Undirected graph.
greedy_edge(s, a).
greedy_edge(s, b).
greedy_edge(a, c).
greedy_edge(a, d).
greedy_edge(b, d).
greedy_edge(b, e).
greedy_edge(c, g).
greedy_edge(d, g).
greedy_edge(e, g).

greedy_connected(X, Y) :- greedy_edge(X, Y).
greedy_connected(X, Y) :- greedy_edge(Y, X).

% Estimated distance to the goal g (lower is better).
greedy_heuristic(s, 4).
greedy_heuristic(a, 3).
greedy_heuristic(b, 2).
greedy_heuristic(c, 2).
greedy_heuristic(d, 1).
greedy_heuristic(e, 2).
greedy_heuristic(g, 0).

greedy_best_first(Start, Goal, Path) :-
    greedy_search([[Start]], Goal, [], ReversePath),
    reverse(ReversePath, Path).

greedy_search(Frontier, Goal, _Visited, Path) :-
    select_best_greedy_path(Frontier, [Goal | Previous], _),
    Path = [Goal | Previous],
    !.
greedy_search(Frontier, Goal, Visited, Path) :-
    select_best_greedy_path(Frontier, [Current | Previous], Remaining),
    (   memberchk(Current, Visited)
    ->  greedy_search(Remaining, Goal, Visited, Path)
    ;   findall([Next, Current | Previous],
                ( greedy_connected(Current, Next),
                  \+ memberchk(Next, [Current | Previous]),
                  \+ memberchk(Next, Visited)
                ),
                NewPaths),
        append(Remaining, NewPaths, NextFrontier),
        greedy_search(NextFrontier, Goal, [Current | Visited], Path)
    ).

select_best_greedy_path(Frontier, BestPath, Remaining) :-
    findall(Heuristic-Path,
            ( member(Path, Frontier),
              Path = [Node | _],
              greedy_heuristic(Node, Heuristic)
            ),
            KeyedPaths),
    keysort(KeyedPaths, [_-BestPath | _]),
    select(BestPath, Frontier, Remaining).
