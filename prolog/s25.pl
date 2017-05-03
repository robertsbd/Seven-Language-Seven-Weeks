flight(ba, [london, bermuda, baltimore]).
flight(ba, [hong_kong, bangkok, columbo, mahe, johannesburg]).
flight(ba, [london, abu_dhabi, singapore, perth, singapore]).
flight(qf, [sydney, honolulu, san_francisco]).
flight(qf, [sydney, perth, harare]).
flight(qf, [sydney, brisbane, singapore, london]).
flight(kl, [amsterdam, aruba, panama, quito, lima]).
flight(kl, [amsterdam, lisbon, rio, buenos_aires, santiago]).
flight(kl, [amsterdam, athens, dubai, bangkok, tokyo]).
flight(pa, [hamburg, london, new_york, san_francisco]).
flight(pa, [new_york, dakar, abidjan, lagos, nairobi]).

fly(Airline, From, To) :-
    flight(Airline, Route),
    member(From, Route),
    member(To, Route).
