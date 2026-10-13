% Practical 8: A* Search using f(n) = g(n) + h(n)
% road(X, Y, Cost) represents an undirected weighted connection.
%
% Example query:
% ?- a_star(s, g, Path, Cost).

astar_road(s, a, 1).
astar_road(s, b, 2).
astar_road(a, c, 2).
astar_road(a, d, 4).
astar_road(b, d, 1).
astar_road(b, e, 3).
astar_road(c, g, 2).
astar_road(d, g, 2).
astar_road(e, g, 5).

astar_connected(X, Y, Cost) :- astar_road(X, Y, Cost).
astar_connected(X, Y, Cost) :- astar_road(Y, X, Cost).

% Consistent heuristic estimates for the sample graph.
astar_heuristic(s, 4).
astar_heuristic(a, 3).
astar_heuristic(b, 2).
astar_heuristic(c, 2).
astar_heuristic(d, 1).
astar_heuristic(e, 2).
astar_heuristic(g, 0).

a_star(Start, Goal, Path, Cost) :-
    astar_heuristic(Start, StartH),
    StartF is StartH,
    astar_search([StartF-(0-[Start])], Goal, [], ReversePath, Cost),
    reverse(ReversePath, Path).

astar_search(Frontier, Goal, VisitedCosts, Path, Cost) :-
    select_best_astar(Frontier, Best, Remaining),
    Best = _F-(CurrentCost-[Current | Previous]),
    (   Current == Goal
    ->  Path = [Current | Previous],
        Cost = CurrentCost
    ;   (   memberchk(Current-OldCost, VisitedCosts),
            OldCost =< CurrentCost
        ->  astar_search(Remaining, Goal, VisitedCosts, Path, Cost)
        ;   findall(NewF-(NewCost-[Next, Current | Previous]),
                    ( astar_connected(Current, Next, StepCost),
                      \+ memberchk(Next, [Current | Previous]),
                      NewCost is CurrentCost + StepCost,
                      astar_heuristic(Next, H),
                      NewF is NewCost + H
                    ),
                    NewEntries),
            append(Remaining, NewEntries, NewFrontier),
            astar_search(NewFrontier, Goal,
                         [Current-CurrentCost | VisitedCosts], Path, Cost)
        )
    ).

select_best_astar(Frontier, Best, Remaining) :-
    keysort(Frontier, [Best | _]),
    select(Best, Frontier, Remaining).
