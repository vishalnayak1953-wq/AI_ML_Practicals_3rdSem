% Practical 2: Arithmetic, factorial, and Fibonacci using recursion
% Prolog dialect: SWI-Prolog
%
% Example queries:
% ?- add_numbers(12, 8, Result).
% ?- divide_numbers(12, 3, Result).
% ?- factorial(5, Result).
% ?- fibonacci(7, Result).
% ?- fibonacci_series(8, Series).

add_numbers(A, B, Result) :- Result is A + B.
subtract_numbers(A, B, Result) :- Result is A - B.
multiply_numbers(A, B, Result) :- Result is A * B.

divide_numbers(_, B, _) :-
    B =:= 0,
    !,
    fail.
divide_numbers(A, B, Result) :- Result is A / B.

% factorial(N, Factorial): valid for non-negative integer N.
factorial(0, 1) :- !.
factorial(N, Result) :-
    integer(N),
    N > 0,
    Previous is N - 1,
    factorial(Previous, PreviousFactorial),
    Result is N * PreviousFactorial.

% Fibonacci indexing starts with fib(0, 0) and fib(1, 1).
fibonacci(0, 0) :- !.
fibonacci(1, 1) :- !.
fibonacci(N, Result) :-
    integer(N),
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1, F1),
    fibonacci(N2, F2),
    Result is F1 + F2.

% Generate the first N Fibonacci terms as a list in linear time.
% The sequence starts with 0, 1, 1, 2, 3, ...
fibonacci_series(N, Series) :-
    integer(N),
    N >= 0,
    fibonacci_series_acc(N, 0, 1, Series).

fibonacci_series_acc(0, _Current, _Next, []) :- !.
fibonacci_series_acc(Count, Current, Next, [Current | Rest]) :-
    Count > 0,
    Remaining is Count - 1,
    NewNext is Current + Next,
    fibonacci_series_acc(Remaining, Next, NewNext, Rest).
