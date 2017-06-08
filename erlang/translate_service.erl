% question 1 day 3 translate process

-module(translate_service).
-export([loop/0, translate/2]).

loop() ->
    receive
        {From, "casa"} ->
	    From ! "house",
            loop();

        {From, "blanca"} ->
	    From ! "white",
	    loop();

	{From, "exit"} ->  
            From ! "exiting",
	    exit({translate_service,die,at,erlang:time()});

        {From, _} ->
            From ! "I don't understand",
            loop()
end.

translate(To, Word) ->
    To ! {self(), Word},
    receive
	Translation -> Translation
end.
