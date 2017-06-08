-module(day3).
-export([q1_async/0, q1_sync/0]).

% day 3 question 1 Monitor the translate_service and restart it should it die
% q1_async() sends and recieves messages in an asyncronous manner

q1_async() ->
    io:format("Spawning new asynchronous process~n"),
    Monitor = spawn(fun monitor_translate:loop/0),
    Monitor ! new,
    io:format("Sending white~n"),
    translator ! "white",
    io:format("Sending casa~n"),    
    translator ! "casa",
    io:format("Sending exit~n"),    
    translator ! "exit",
    io:format("Sending hello~n"),    
    translator ! "hello",    
    io:format("Sending casa~n"),    
    translator ! "casa".

% q1_sync() sends and receives messages in a synchronouse manner

q1_sync() ->
    io:format("Spawning new synchronous process~n"),
    Monitor = spawn(fun monitor_translation_service:loop/0),
    Monitor ! new,
    io:format("Sending white~n"),
    io:format("~p~n", [translate_service:translate(translator, "white")]),
    io:format("Sending casa~n"),    
    io:format("~p~n", [translate_service:translate(translator, "casa")]),
    io:format("Sending exit~n"),    
    io:format("~p~n", [translate_service:translate(translator, "exit")]),
    io:format("Sending hello~n"),    
    io:format("~p~n", [translate_service:translate(translator, "hello")]). % line produces error when called from within function but not if called through the interpreter
