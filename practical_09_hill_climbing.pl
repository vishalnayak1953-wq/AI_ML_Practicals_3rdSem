% Practical 9: Hill Climbing for numerical optimization
% Search domain: integer X from 0 through 10.
% Objective: maximize f(X) = 25 - (X - 5)^2; the maximum is at X = 5.
%
% Example query:
% ?- hill_climb(0, BestX, BestValue).

hill_objective(X, Value) :-
    Value is 25 - (X - 5) * (X - 5).

hill_neighbor(X, Neighbor) :-
    Neighbor is X - 1,
    Neighbor >= 0,
    Neighbor =< 10.
hill_neighbor(X, Neighbor) :-
    Neighbor is X + 1,
    Neighbor >= 0,
    Neighbor =< 10.

hill_climb(Start, BestX, BestValue) :-
    integer(Start),
    Start >= 0,
    Start =< 10,
    hill_objective(Start, StartValue),
    hill_climb_loop(Start, StartValue, BestX, BestValue).

hill_climb_loop(CurrentX, CurrentValue, BestX, BestValue) :-
    findall(Value-Neighbor,
            ( hill_neighbor(CurrentX, Neighbor),
              hill_objective(Neighbor, Value)
            ),
            Candidates),
    keysort(Candidates, SortedCandidates),
    last(SortedCandidates, BestNeighborValue-BestNeighbor),
    (   BestNeighborValue > CurrentValue
    ->  hill_climb_loop(BestNeighbor, BestNeighborValue, BestX, BestValue)
    ;   BestX = CurrentX,
        BestValue = CurrentValue
    ).
