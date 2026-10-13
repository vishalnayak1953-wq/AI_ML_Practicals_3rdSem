% Practical 3: Append, reverse, member search, and list length
% Prolog dialect: SWI-Prolog
%
% Example queries:
% ?- my_append([a,b], [c,d], Result).
% ?- my_reverse([1,2,3,4], Result).
% ?- member_of(blue, [red, blue, green]).
% ?- my_list_length([p,q,r,s], Length).

my_append([], List, List).
my_append([Head | Tail], List2, [Head | Result]) :-
    my_append(Tail, List2, Result).

my_reverse(List, Reversed) :-
    reverse_accumulator(List, [], Reversed).

reverse_accumulator([], Accumulator, Accumulator).
reverse_accumulator([Head | Tail], Accumulator, Reversed) :-
    reverse_accumulator(Tail, [Head | Accumulator], Reversed).

member_of(Item, [Item | _]).
member_of(Item, [_ | Tail]) :-
    member_of(Item, Tail).

my_list_length([], 0).
my_list_length([_ | Tail], Length) :-
    my_list_length(Tail, TailLength),
    Length is TailLength + 1.
