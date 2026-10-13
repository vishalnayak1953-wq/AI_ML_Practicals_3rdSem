% Practical 4: Timetable knowledge base and queries
% Prolog dialect: SWI-Prolog
%
% schedule(Day, TimeSlot, Subject, Faculty, Room).
%
% Example queries:
% ?- schedule(monday, Time, Subject, Faculty, Room).
% ?- faculty_classes(dr_sharma, Classes).
% ?- subject_timetable(artificial_intelligence, Entries).
% ?- room_schedule(room_101, Schedule).

schedule(monday, '09:00-10:00', artificial_intelligence, dr_sharma, room_101).
schedule(monday, '10:00-11:00', data_structures, prof_mehta, lab_1).
schedule(monday, '11:15-12:15', mathematics, dr_verma, room_102).
schedule(tuesday, '09:00-10:00', java_programming, prof_singh, lab_2).
schedule(tuesday, '10:00-11:00', artificial_intelligence, dr_sharma, room_101).
schedule(wednesday, '09:00-10:00', data_structures, prof_mehta, lab_1).
schedule(wednesday, '11:15-12:15', java_programming, prof_singh, lab_2).
schedule(thursday, '10:00-11:00', mathematics, dr_verma, room_102).
schedule(friday, '09:00-10:00', artificial_intelligence, dr_sharma, room_101).

faculty_classes(Faculty, Classes) :-
    findall(Day-Time-Subject-Room,
            schedule(Day, Time, Subject, Faculty, Room),
            Classes).

subject_timetable(Subject, Entries) :-
    findall(Day-Time-Faculty-Room,
            schedule(Day, Time, Subject, Faculty, Room),
            Entries).

room_schedule(Room, Schedule) :-
    findall(Day-Time-Subject-Faculty,
            schedule(Day, Time, Subject, Faculty, Room),
            Schedule).
