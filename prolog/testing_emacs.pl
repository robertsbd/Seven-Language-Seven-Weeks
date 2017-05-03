directlyIn(katarina, olga).
directlyIn(olga, natasha).
directlyIn(natasha, irina).

in2(Outside, Inside) :- directlyIn(Outside, Inside).
in2(Outside, Inside) :-
	directlyIn(Outside, Middle),
	in2(Middle, Inside).