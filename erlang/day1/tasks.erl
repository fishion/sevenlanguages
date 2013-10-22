-module(tasks).
-export([charcount/1,
         wordcount/1,
         countN/1,
         count10/0,
         yayornay/1]).

% not a homework question, but seemed easier than the word count one.
charcount([]) -> 0;
charcount([_ | Tail]) -> 1 + charcount(Tail).

% function using recursion to count number of words in a string
spacecount([]) -> 0;
spacecount([Head | Tail]) -> spacecount(Head) + spacecount(Tail);
spacecount(32) -> 1;
spacecount(_) -> 0.

wordcount([]) -> 0;
wordcount(String) -> 1 + spacecount(String).

% function using recursion to count to 10
countN(0) -> "";
countN(N) -> countN(N-1), io:format("~w, ", [N]).
count10() -> countN(10).

% function to either print "success" or "error: message" depending on input of form
% {error, Message} or success (atom)
yayornay(success) -> "success";
yayornay({error, Message}) -> "error : " ++ Message.
