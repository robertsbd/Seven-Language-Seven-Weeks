succeeded(cameron, brown).
succeeded(may, cameron).
succeeded(brown, blair).
succeeded(blair, major).

% to find out if someone was a successor
successor(New, Old) :- succeeded(New, Old).
successor(New, Old) :-
    succeeded(New, Intermediate),
    successor(Intermediate, Old).

% If we want to know the predecessor we can just reverse thing from finding the sucessor
predecessor(Old, New) :- successor(New, Old).