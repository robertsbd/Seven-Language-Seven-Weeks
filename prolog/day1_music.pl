musician_instrument(dave, guitar).
musician_instrument(ben, piano).
musician_instrument(jill, guitar).
musician_instrument(bryony, harp).
musician_instrument(desda, piano).
musician_instrument(amanda, guitar).
musician_instrument(bert, piano).
musician_instrument(sam, harp).

musician_genre(dave, rock).
musician_genre(ben, rock).
musician_genre(jill, rock).
musician_genre(bryony, classic).
musician_genre(desda, classic).
musician_genre(amanda, classic).
musician_genre(bert, electronic).
musician_genre(sam, electronic).

instrument_genre(X, Y) :- musician_instrument(Z, X), musician_genre(Z, Y).

% to get all the musicians who play the guitar
% findall(Name, musician_instrument(Name, guitar), Return).

