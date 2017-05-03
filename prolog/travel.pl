/* Practical Session 3.4 From Learn Prolog Now */

byCar(auckland,hamilton). 
byCar(hamilton,raglan). 
byCar(valmont,saarbruecken). 
byCar(valmont,metz). 

byTrain(metz,frankfurt). 
byTrain(saarbruecken,frankfurt). 
byTrain(metz,paris). 
byTrain(saarbruecken,paris). 

byPlane(frankfurt,bangkok). 
byPlane(frankfurt,singapore). 
byPlane(paris,losAngeles). 
byPlane(bangkok,auckland). 
byPlane(singapore,auckland). 
byPlane(losAngeles,auckland).


route(Start, End, go(Start, End)) :- byCar(Start, End).
route(Start, End, go(Start, End)) :- byTrain(Start, End).
route(Start, End, go(Start, End)) :- byPlane(Start, End).

can_travel(Start, End, R) :- route(Start, End, _).
can_travel(Start, End, R) :-
    route(Start, Intermediate, go(Start, Intermediate)),
    can_travel(Intermediate, End, go(Intermediate, End)).