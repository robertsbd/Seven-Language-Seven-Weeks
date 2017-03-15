% Reverse a list

reverseList([], []).
reverseList(X, [X]).
reverseList(R, [X|Xs]) :- reverseList(T, Xs), append(T, [X], R).

% Min of two numbers. Returns the case which is true. Can be seen by the first argument.
minOfTwo(Y, X, Y) :- X >= Y.
minOfTwo(X, X, Y) :- X < Y.

% Min of a list, both of these work. I am going to use minOfList
minOfList(X, [X]).
minOfList([H|T], Min) :- minOfList(T, M1), (H<M1 -> Min is H ; Min is M1).

minOfList2(X, [X]).
minOfList2([H|T], Min) :- minOfList2(T, M1), minOfTwo(Min, H, M1).

% Sort a list using minOfList
gt(X, X, Y) :- X >= Y.
gt(Y, X, Y) :- X < Y.

sortList([S], [S]).
sortList([H|T], S) :- sortList(T, S1), append(T, minOfList(T, Min), S).