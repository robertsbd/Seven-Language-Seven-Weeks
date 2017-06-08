% question 1 day 3 translate process

-module(translate_q2_q3).
-export([loop/0, translate/2, doctor/0, doctor_mon/0]).

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

doctor() ->
    process_flag(trap_exit, true),
    receive
	new ->
	    io:format("Creating and monitoring translation process.~n"),
	    register(translator, spawn_link(fun loop/0)),
	    doctor();

	{'EXIT', From, Reason} ->
	    io:format("translator process ~p exited with reason ~p.", [From, Reason]), 
      	    io:format(" Restarting. ~n"),
	    doctor()
end.

doctor_mon() ->
    process_flag(trap_exit, true),
    receive
	new ->
	    io:format("Creating and monitoring translation process.~n"),
	    register(doctormonitor, spawn_link(fun doctor/0)),
	    doctor ! new,
	    doctor_mon();

	{'EXIT', From, Reason} ->
	    io:format("translator process ~p exited with reason ~p.", [From, Reason]), 
      	    io:format(" Restarting. ~n"),
	    self() ! new,
	    doctor_mon()
end.

