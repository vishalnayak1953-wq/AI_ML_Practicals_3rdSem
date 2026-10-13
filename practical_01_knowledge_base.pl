% Practical 1: Student-Course Knowledge Base
% Prolog dialect: SWI-Prolog
%
% Example queries:
% ?- student_course(vishal, Course).
% ?- students_in_course(artificial_intelligence, Students).
% ?- course_mates(vishal, OtherStudent).

% Facts: students and courses
student(vishal).
student(riya).
student(aman).
student(neha).

course(java_programming).
course(artificial_intelligence).
course(data_structures).
course(mathematics).

% Enrollment relationship: enrolled(Student, Course).
enrolled(vishal, java_programming).
enrolled(vishal, artificial_intelligence).
enrolled(riya, artificial_intelligence).
enrolled(riya, mathematics).
enrolled(aman, data_structures).
enrolled(aman, java_programming).
enrolled(neha, mathematics).
enrolled(neha, artificial_intelligence).

% Rules (predicates derived from facts).
student_course(Student, Course) :-
    student(Student),
    course(Course),
    enrolled(Student, Course).

students_in_course(Course, Students) :-
    course(Course),
    findall(Student, enrolled(Student, Course), Students).

course_mates(Student, OtherStudent) :-
    enrolled(Student, Course),
    enrolled(OtherStudent, Course),
    Student \= OtherStudent.
