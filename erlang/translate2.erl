% question 1 day 3 translate process

-module(translate2).
-export([loop/0]).

loop() ->
    receive
        "casa" ->
            io:format("house~n"),
            loop();

        "blanca" ->
            io:format("white~n"),
	    loop();

	"exit" ->    % the atom exit will provide for exiting the process
	    io:format("exiting~n"),
	    exit({translate2,die,at,erlang:time()});

        _ ->
            io:format("I don't understand.~n"),
            loop()
end.
