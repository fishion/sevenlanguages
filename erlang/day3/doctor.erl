-module(doctor).
-export([loop/0]).

loop() ->
    process_flag(trap_exit, true),
    receive
        new ->
            io:format("Creating and monitoring process.~n"),
            register(gun, spawn_link(fun roulette:loop/0)),
            loop();
        {'EXIT', From, Reason} ->
            io:format("The shooter ~p dies with reason ~p.", [From, Reason]),
            io:format("starting another one.~n"),
            self() ! new,
            loop()
    end.
