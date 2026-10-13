% Practical 11: Map Coloring as a Constraint Satisfaction Problem (CSP)
% Adjacent regions must have different colors. Backtracking tests assignments.
%
% Example query:
% ?- map_coloring(Assignment).

map_border(wa, nt).
map_border(wa, sa).
map_border(nt, sa).
map_border(nt, q).
map_border(sa, q).
map_border(sa, nsw).
map_border(sa, v).
map_border(q, nsw).
map_border(nsw, v).
% Tasmania (t) is an island and has no shared land border in this model.

map_adjacent(Region1, Region2) :- map_border(Region1, Region2).
map_adjacent(Region1, Region2) :- map_border(Region2, Region1).

map_coloring(Assignment) :-
    Regions = [wa, nt, sa, q, nsw, v, t],
    assign_region_colors(Regions, [], ReverseAssignment),
    reverse(ReverseAssignment, Assignment).

assign_region_colors([], Assigned, Assigned).
assign_region_colors([Region | Remaining], Assigned, Solution) :-
    member(Color, [red, green, blue]),
    \+ ( map_adjacent(Region, Neighbor),
         memberchk(Neighbor-Color, Assigned)
       ),
    assign_region_colors(Remaining, [Region-Color | Assigned], Solution).
