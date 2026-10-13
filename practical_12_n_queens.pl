% Practical 12: N-Queens using backtracking
% Output list: item at index Row gives the column containing that row's queen.
% No two queens share a column or diagonal.
%
% Example queries:
% ?- n_queens(4, Positions).
% ?- findall(Positions, n_queens(4, Positions), Solutions).

n_queens(N, Positions) :-
    integer(N),
    N > 0,
    place_queens(1, N, [], ReversePositions),
    reverse(ReversePositions, Positions).

place_queens(Row, N, PlacedColumns, PlacedColumns) :-
    Row > N,
    !.
place_queens(Row, N, PlacedColumns, Solution) :-
    between(1, N, Column),
    queen_is_safe(Column, PlacedColumns, 1),
    NextRow is Row + 1,
    place_queens(NextRow, N, [Column | PlacedColumns], Solution).

queen_is_safe(_Column, [], _RowDistance).
queen_is_safe(Column, [PreviousColumn | Remaining], RowDistance) :-
    Column =\= PreviousColumn,
    abs(Column - PreviousColumn) =\= RowDistance,
    NextDistance is RowDistance + 1,
    queen_is_safe(Column, Remaining, NextDistance).
