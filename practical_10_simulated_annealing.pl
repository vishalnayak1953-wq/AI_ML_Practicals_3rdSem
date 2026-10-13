% Practical 10: Simulated Annealing for optimization
% Demonstration objective has a global peak near X=4 and a local peak near X=15.
% Downhill moves may be accepted with probability exp((new-old)/temperature).
% The result is stochastic: run the query more than once to compare outcomes.
%
% Example query:
% ?- simulated_annealing(15, 1000, BestX, BestValue).

:- use_module(library(random)).

sa_objective(X, Value) :-
    (   X =< 10
    ->  Value is 20 - 2 * abs(X - 4)
    ;   Value is 12 - 2 * abs(X - 15)
    ).

sa_neighbor(X, Neighbor) :-
    Neighbor is X - 1,
    Neighbor >= 0,
    Neighbor =< 20.
sa_neighbor(X, Neighbor) :-
    Neighbor is X + 1,
    Neighbor >= 0,
    Neighbor =< 20.

simulated_annealing(Start, Steps, BestX, BestValue) :-
    integer(Start), Start >= 0, Start =< 20,
    integer(Steps), Steps >= 0,
    sa_objective(Start, StartValue),
    sa_anneal(Start, StartValue, Start, StartValue,
              10.0, Steps, BestX, BestValue).

sa_anneal(_CurrentX, _CurrentValue, BestX, BestValue,
          Temperature, Steps, BestX, BestValue) :-
    ( Steps =< 0 ; Temperature =< 0.01 ),
    !.
sa_anneal(CurrentX, CurrentValue, BestX, BestValue,
          Temperature, Steps, FinalBestX, FinalBestValue) :-
    findall(Neighbor, sa_neighbor(CurrentX, Neighbor), Neighbors),
    random_member(Candidate, Neighbors),
    sa_objective(Candidate, CandidateValue),
    sa_choose_move(Candidate, CandidateValue, CurrentX, CurrentValue,
                   Temperature, NextX, NextValue),
    (   CandidateValue > BestValue
    ->  NextBestX = Candidate,
        NextBestValue = CandidateValue
    ;   NextBestX = BestX,
        NextBestValue = BestValue
    ),
    NewTemperature is Temperature * 0.99,
    NewSteps is Steps - 1,
    sa_anneal(NextX, NextValue, NextBestX, NextBestValue,
              NewTemperature, NewSteps, FinalBestX, FinalBestValue).

sa_choose_move(Candidate, CandidateValue, _CurrentX, CurrentValue,
               _Temperature, Candidate, CandidateValue) :-
    CandidateValue >= CurrentValue,
    !.
sa_choose_move(Candidate, CandidateValue, CurrentX, CurrentValue,
               Temperature, NextX, NextValue) :-
    random_between(0, 1000000, RandomInteger),
    RandomValue is RandomInteger / 1000000,
    Probability is exp((CandidateValue - CurrentValue) / Temperature),
    (   RandomValue < Probability
    ->  NextX = Candidate,
        NextValue = CandidateValue
    ;   NextX = CurrentX,
        NextValue = CurrentValue
    ).
