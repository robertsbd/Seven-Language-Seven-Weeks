-module(doctor_restart).
-export([doctor/0, doctor_sup/0]).

doctor() ->
    process_flag(trap_exit, true),
    receive
	new ->
	    io:format("Creating and monitoring process.~n"),
	    register(revolver, spawn_link(fun roulette:loop/0)),
	    doctor();

	kill_doc ->
	     io:format("Doctor died!~n"),
	     exit({doctor,die,at, erlang:time()});

	{'EXIT', From, Reason} ->
	    io:format("The shooter ~p died with reason ~p.", [From, Reason]),
	    io:format(" Restarting. ~n"),
	    self() ! new,
	    doctor()
        end.

doctor_sup() ->
    process_flag(trap_exit, true),
    receive
	new ->
	    io:format("Creating doctor monitor.~n"),
	    register(doctor, spawn_link(fun doctor/0)),
	    doctor_sup();

	{'EXIT', From, Reason} ->
	    io:format("The doctor ~p died with reason ~p.", [From, Reason]),
	    io:format(" Restarting. ~n"),
	    self() ! new,
	    % doctor ! new, <== this doesn't work, try to also re-spawn the revolver 
	    doctor_sup()
    end.
