%# Examples

count([],0).
count([_|Tail], Count) :- count(Tail,TailCount), Count is TailCount + 1.

sum([],0).
sum([Head|Tail], Total) :- sum(Tail, Sum), Total is Head + Sum.

average(List, Average) :- sum(List, Sum), count(List, Count), Average is Sum/Count.

concatenate([], List, List).
concatenate([Head|Tail1], List, [Head|Tail2]) :-
    concatenate(Tail1, List, Tail2).

%# Homework

%# reverse_list(List, Result).
reverse_list([], []).
reverse_list([Head|Tail], Result) :-
    reverse_list(Tail, Revtail),
    append(Revtail, [Head], Result).

%# min(List, Result, Remainder).
min([A],A,[]).
min([A,B],A,[B]) :- A = B.
min([A,B],A,[B]) :- A < B.
min([A,B],B,[A]) :- A > B.
min([A|[B|Tail]], Result, Remainder) :-
    min([A,B],C,D),
    append([C], Tail, Newlist),
    min(Newlist, Result, NotMin),
    append(D,NotMin,Remainder).

%# sortlist(List, Result)
sortlist([A],[A]).
sortlist(List, [Rhead|Rtail]) :-
    min(List, Rhead, Remainder),
    sortlist(Remainder, Rtail).

