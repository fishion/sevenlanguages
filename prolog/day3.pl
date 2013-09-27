%# 4x4 sudoku
%# sudoku4([_,_,2,3,
%#          _,_,_,_,
%#          _,_,_,_,
%#          3,4,_,_ ],
%#          Solution).
sudoku4(Puzzle, Solution) :-
    Solution = Puzzle,
    Solution = [ S11,S12,S13,S14,
                 S21,S22,S23,S24,
                 S31,S32,S33,S34,
                 S41,S42,S43,S44 ],
    fd_domain(Solution, 1, 4),

    Row1 = [S11,S12,S13,S14],
    Row2 = [S21,S22,S23,S24],
    Row3 = [S31,S32,S33,S34],
    Row4 = [S41,S42,S43,S44],

    Col1 = [S11,S21,S31,S41],
    Col2 = [S12,S22,S32,S42],
    Col3 = [S13,S23,S33,S43],
    Col4 = [S14,S24,S34,S44],

    Squ1 = [S11,S12,S21,S22],
    Squ2 = [S13,S14,S23,S24],
    Squ3 = [S31,S32,S33,S34],
    Squ4 = [S33,S34,S43,S44],

    valid([Row1,Row2,Row3,Row4,
           Col1,Col2,Col3,Col4,
           Squ1,Squ2,Squ3,Squ4]).

valid([]).
valid([Head|Tail]) :-
    fd_all_different(Head),
    valid(Tail).


%# eight_queens(List)

% A valid board has 8 queens
eight_queens(Board) :-
    Board = [(1,_), (2,_), (3,_), (4,_), (5,_), (6,_), (7,_), (8,_)],

    cols(Board, Cols),
    arr_member(Cols),

    diag1(Board, Diag1),
    diag2(Board, Diag2),

    fd_all_different(Cols),
    fd_all_different(Diag1),
    fd_all_different(Diag2).

% helpers to get all the cols and numbers representing unique diagonals
cols([],[]).
cols([(_, Col)|QueenTail], [Col|ColTail]) :-
    cols(QueenTail, ColTail).
diag1([],[]).
diag1([(Row, Col)|QueenTail], [Diag|DiagTail]) :-
    Diag is Col - Row,
    diag1(QueenTail, DiagTail).
diag2([],[]).
diag2([(Row, Col)|QueenTail], [Diag|DiagTail]) :-
    Diag is Col + Row,
    diag2(QueenTail, DiagTail).

arr_member([]).
arr_member([Head|Tail]) :-
    member(Head,[1,2,3,4,5,6,7,8]),
    arr_member(Tail).
