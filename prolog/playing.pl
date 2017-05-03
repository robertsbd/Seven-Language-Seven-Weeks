dispatch(monday, [lot506, lol737, lot738, lot741, lot890]).
dispatch(tuesday, [lot663, lot667]).
dispatch(wednesday, []).

fragile([lot738, lot741, lot667, lot506]).

% test if target is a member of a list
is_member([Target|_], Target).
is_member([_|T], Target) :- is_member(T, Target).

special_packaging(Day, Object) :-
    dispatch(Day, DispatchList),
    fragile(FragileList),
    member(Object, FragileList),
    member(Object, DispatchList).

% simple translation

word(pete, pierre).
word(flies, pilote).
word(an, un).
word(aeroplane, avion).

translate([], []).
translate([Ehead|Etail], [Fhead|Ftail]) :-
    word(Ehead, Fhead),
    translate(Etail, Ftail).


%will also search embedded lists
dmember(Element, Element).
dmember(Element, [Head|_]) :- dmember(Element, Head).
dmember(Element, [_| Tail]) :- dmember(Element, Tail).

delete_element(Element, [Element|Remainder], Remainder).
delete_element(Element, [H|T], [H|T1]) :-
    delete_element(Element, T, T1).

permutation2([],[]).
permutation2(List, [Element|Tail]):- 
    delete_element(Element, List, Remainder),
    permutation2(Remainder, Tail).

% member defined using append.

member_append(Element, List) :-
    append(_, [Element|_], List).

% delete with append
delete_append([], []).
delete_append(R, Del, [H|T]) :-
    append(Del, R, [H|T]),
    delete_append(R, Del, T).

sub_list(Sub, List) :- 
    append(_, [[Sub]|_], List).

numeral(0).
numeral(suxx(X)) :- numeral(X).

%rev([], R).
rev([H|T], R) :- 
    rev(T, [H|R1]).