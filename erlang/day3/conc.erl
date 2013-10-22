-module(conc).
-export([loop/0,
         translate/2]).

loop() -> receive
    {From, "casa"} ->
        From ! "house",
        loop();
    {From, "blanca"} ->
        From ! "white",
        loop();
    {From, _} ->
        From ! "no idea",
        loop()
end.

translate(Proc, Word) ->
    Proc ! {self(), Word},
    receive Translated -> Translated end.
