musician(mark, piano).
musician(jon, guitar).
musician(dave, guitar).

musician_genre(mark, rock).
musician_genre(jon, rock).
musician_genre(dave, metal).

instrument(X, Y) :- musician(Y, X).
