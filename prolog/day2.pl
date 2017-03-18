% Reverse a list

reverseList([], []).
reverseList([R], R).
reverseList([H|T], R) :- reverseList(T, T1), append(T1, [H], R).

% Min of two numbers. Returns the case which is true. Can be seen by the first argument.
minOfTwo(Y, X, Y) :- X >= Y.
minOfTwo(X, X, Y) :- X < Y.

% Min of a list, both of these work. I am going to use minOfList
min_in_list([Min], Min).

min_in_list([H, K|T], Min) :- 
    H =< K,
    min_in_list([H|T], Min).

min_in_list([H, K|T], Min) :-
    H > K,
    min_in_list([K|T], Min).

% Sort a list using minOfList
sort_list([],[]).
sort_list([S], S).

sort_list([H, K|T], S) :- 
    H =< K,
    sort_list([H, K|T], S).

sort_list([H, K|T], Min) :-
    H > K,
    sort_list([K, H|T], S).



add(succ(succ(0)), succ(succ(0)), succ(succ(succ(0)))).