-module(doctor_dualmon).
-export([doctor1/0, doctor2/0]).
-export([start/0]).


doctor1() ->
    process_flag(trap_exit, true),
    receive
	new_doc ->
	    io:format("Creating doc 2.~n"),
	    register(doctor2, spawn_link(fun doctor2/0)),
	    doctor1();

	say_hello ->
	    io:format("Doc 1 says hello.~n"),
	    doctor1();

	kill ->
	     io:format("Doctor 1 killed themselves!~n"),
	     exit({doctor1,die,at, erlang:time()});

	{'EXIT', From, Reason} ->
	    io:format("Doc ~p died with reason ~p.", [From, Reason]),
	    io:format(" Restarting. ~n"),
	    self() ! new_doc,
	    doctor1()
end.

doctor2() ->
    process_flag(trap_exit, true),
    receive
	new_doc ->
	    io:format("Creating doc 1.~n"),
	    register(doctor1, spawn_link(fun doctor1/0)),
	    doctor2();

	say_hello ->
	    io:format("Doc 2 says hello.~n"),
	    doctor2();

	kill ->
	     io:format("Doctor 2 killed themselves!~n"),
	     exit({doctor2,die,at, erlang:time()});

	{'EXIT', From, Reason} ->
	    io:format("Doc ~p died with reason ~p.", [From, Reason]),
	    io:format(" Restarting. ~n"),
	    self() ! new_doc,
	    doctor2()
end.

% below does not work. How do we do this

start() ->
    spawn(fun doctor1/0), % need a process to start it all off, is a doc 1
    self() ! new_doc,  % creates a new doctor2
    doctor2 ! new_doc,  % spawn a doctor1
    doctor1 ! say_hello,
    doctor2 ! say_hello,
    doctor1 ! kill,
    doctor2 ! kill,
    doctor1 ! kill,
    doctor2 ! kill,
    doctor1 ! say_hello,
    doctor2 ! say_hello.
