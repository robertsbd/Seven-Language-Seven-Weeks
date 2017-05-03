new_list([], []).

new_list([H|[]], [H]).

new_list([H|T], [H|Y]) :-
    new_list(T,Y).