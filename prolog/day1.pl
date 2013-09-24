likes(wallace, cheese).
likes(grommit, cheese).
likes(wendolene, sheep).

friend(X,Y) :- \+(X=Y), likes(X,Z), likes(Y,Z).



different(red,green). different(red,blue).
different(green,red). different(green,blue).
different(blue,green). different(blue,red).

colouring(Alabama, Mississippi, Georgia, Tennessee, Florida) :-
    different(Mississippi, Tennessee),
    different(Mississippi, Alabama),
    different(Alabama, Tennessee),
    different(Alabama, Missisippi),
    different(Alabama, Georgia),
    different(Alabama, Florida),
    different(Georgia, Florida),
    different(Georgia, Tennessee).
