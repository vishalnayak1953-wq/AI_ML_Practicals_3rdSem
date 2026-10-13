% Practical 5: Rule-based classification of students
% Rule thresholds used in this demonstration:
%   Topper: percentage >= 85
%   Average/pass: percentage >= 50 and < 85
%   Fail: percentage < 50
%
% Example queries:
% ?- student_result(riya, Result).
% ?- percentage(aman, Percentage).
% ?- findall(Name-Result, student_result(Name, Result), Results).

% student_marks(Name, Subject1, Subject2, Subject3).
student_marks(vishal, 88, 91, 84).
student_marks(riya, 95, 90, 93).
student_marks(aman, 55, 62, 58).
student_marks(neha, 35, 42, 39).
student_marks(kabir, 70, 68, 74).

total_marks(Name, Total) :-
    student_marks(Name, A, B, C),
    Total is A + B + C.

percentage(Name, Percentage) :-
    total_marks(Name, Total),
    Percentage is Total / 3.

student_result(Name, topper) :-
    percentage(Name, Percentage),
    Percentage >= 85.

student_result(Name, average) :-
    percentage(Name, Percentage),
    Percentage >= 50,
    Percentage < 85.

student_result(Name, fail) :-
    percentage(Name, Percentage),
    Percentage < 50.
