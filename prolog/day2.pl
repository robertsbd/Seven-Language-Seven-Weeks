% Reverse a list
/*
reverseList([], []).
reverseList([R], R).
reverseList([H|T], R) :- reverseList(T, T1), append(T1, [H], R).

% Min of two numbers. Returns the case which is true. Can be seen by the first argument.
minOfTwo(Y, X, Y) :- X >= Y.
minOfTwo(X, X, Y) :- X < Y.

% Min of a list, both of these work. I am going to use minOfList
min_of_list(Min,[Min]).
min_of_list(Min, [H|T]) :- 
    Min < H,
    min_of_list(Min, T).

uni(X, Y) :- 
    Y = X,
    X = 1,
    X = 2.

*/

summ([], 0).
summ([H|T], Sum) :-
    summ(T, Sum1),
    Sum is Sum1 + H.

fact(0, Fact).
fact(X, Fact) :-
    X is X - 1,
    fact(X, Fact1),
    Fact is Fact1 * H.

interleave(X, [], Y).
interleave([], Y, Y).
interleave([], [], OutList).
interleave([H1|T1], [H2|T2], [H1, H2 | OutList]) :-
    interleave(T1, T2, OutList).