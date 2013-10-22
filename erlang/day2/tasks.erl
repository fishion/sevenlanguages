-module(tasks).
-export([keylookup/2,
         totalprices/1,
         ttt/1]).

% function to accept a list of keyval tuples, and a key, and return the associated value
% TestList = [{erlang, "a functional language"},{ruby, "an OO language"}].
% tasks:keylookup(TestList, erlang).
keylookup([], _) -> notfound;
keylookup([{K, Val}|_],K) -> Val;
keylookup([_|T],K) -> keylookup(T,K).

% This was the original way of doing it, which is more proceedural and less clever
%keylookup([], _) -> notfound;
%keylookup([{Testkey, Val}|T],K) ->
%    if
%        (Testkey == K) -> Val;
%        true -> keylookup(T,K)
%    end.


% list comprehension to convert list of tuples of form [{item, price, qty}, ...]
% to [{item, total_price}, ...]
% tasks:totalprices([{bananas, 0.3, 10}, {milk, 1.50, 1}, {rolls, 0.40, 5}]).
totalprices(X) -> [ {Item, Price * Qty} || {Item, Price, Qty} <- X ].

% take a list or tuple representing a tictactoe board, and return x, o, none_yet, or no_moves_remain
% TESTBOARDS
% tasks:ttt([x,x,y,x,y,x,x,x,y]).  -- X column
% tasks:ttt([x,y,y,y,x,x,x,y,x]).  -- X diagonal
% tasks:ttt([x,x,y,y,y,x,x,x,y]).  -- no_moves_remain
% tasks:ttt([x,x,y,null,y,x,x,x,y]). -- none_yet
% tasks:ttt([null,x,y,null,y,x,null,x,y]). -- none_yet
ttt([Winner,_,_,Winner,_,_,Winner,_,_]) when Winner /= null -> Winner;
ttt([_,Winner,_,_,Winner,_,_,Winner,_]) when Winner /= null -> Winner;
ttt([_,_,Winner,_,_,Winner,_,_,Winner]) when Winner /= null -> Winner;
ttt([Winner,Winner,Winner,_,_,_,_,_,_]) when Winner /= null -> Winner;
ttt([_,_,_,Winner,Winner,Winner,_,_,_]) when Winner /= null -> Winner;
ttt([_,_,_,_,_,_,Winner,Winner,Winner]) when Winner /= null -> Winner;
ttt([Winner,_,_,_,Winner,_,_,_,Winner]) when Winner /= null -> Winner;
ttt([_,_,Winner,_,Winner,_,Winner,_,_]) when Winner /= null -> Winner;
ttt([null|_]) -> none_yet;
ttt([_|T]) -> ttt(T);
ttt([]) -> no_moves_remain.
