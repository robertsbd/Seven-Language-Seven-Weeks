-module(otp_server).
-behaviour(gen_server).

-export([start_link/0]).
-export([init/1, handle_call/2, send_message/2]).

%%% Client API
start_link() ->
    gen_server:start_link(?MODULE, [], []).

%% Synchronous call
send_message(Pid, Message) ->
   gen_server:call(Pid, {message, Message}).

%% %% This call is asynchronous
%% return_cat(Pid, Cat = #cat{}) ->
%%     gen_server:cast(Pid, {return, Cat}).

%% %% Synchronous call
%% close_shop(Pid) ->
%%     gen_server:call(Pid, terminate).

%%% Server functions
init([]) -> {ok, []}. %% no treatment of info here!

handle_call(Pid, {message, Message}) ->
    io:format("****").


%% handle_call({order, Name, Color, Description}, _From, Cats) ->
%%     if Cats =:= [] ->
%%         {reply, make_cat(Name, Color, Description), Cats};
%%        Cats =/= [] ->
%%         {reply, hd(Cats), tl(Cats)}
%%     end;
%% handle_call(terminate, _From, Cats) ->
%%     {stop, normal, ok, Cats}.

%% handle_cast({return, Cat = #cat{}}, Cats) ->
%%     {noreply, [Cat|Cats]}.

%% handle_info(Msg, Cats) ->
%%     io:format("Unexpected message: ~p~n",[Msg]),
%%     {noreply, Cats}.

%% terminate(normal, Cats) ->
%%     [io:format("~p was set free.~n",[C#cat.name]) || C <- Cats],
%%     ok.

%% code_change(_OldVsn, State, _Extra) ->
%%     %% No change planned. The function is there for the behaviour,
%%     %% but will not be used. Only a version on the next
%%     {ok, State}. 

%% %%% Private functions
%% make_cat(Name, Col, Desc) ->
%%     #cat{name=Name, color=Col, description=Desc}.
