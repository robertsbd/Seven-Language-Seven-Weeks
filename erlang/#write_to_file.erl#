-module(write_to_file).
-export([server/0]).

% when spawned server will need to be supplied with the filename as an arguement
% eg. spawn(fun write_to_file: server, ["log"])


server() ->
    receive
	{Message} ->
	    Filename = "log.txt",
	    io:format("Message: ~p", [Message]),
	    file:write_file(Filename, [Message] ++ "\n", [append]),
	    server()
    end.
	
