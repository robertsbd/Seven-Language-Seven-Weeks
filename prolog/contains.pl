contains(b1, b2).
contains(b1, b3).
contains(b1, b4).
contains(b1, b5).
contains(b2, b9).
contains(b2, b10).
contains(b5, b6).
contains(b5, b7).
contains(b7, b8).

encloses(Out, In) :- 
    contains(Out, In).

encloses(Out, In) :-
    contains(Out, Middle),
    encloses(Middle, In).