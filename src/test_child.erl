
-module(test_child).
-vsn(1).
-export([start_link/0, stop/0, stop/1]).
-export([wait_to_stop/1]).


start_link() ->
	io:format("test_child: start_link~n"),
	Pid = spawn_link(?MODULE, wait_to_stop, [5000]),
	{ok, Pid}.

wait_to_stop(Timeout) ->
	io:format("test_child: wait_to_stop: ~p~n", [Timeout]),
	register(?MODULE, self()),
	receive
		Reason ->
			Reason
	after
		Timeout ->
			Reason = timeout	
	end,
	io:format("test_child: stopping: ~p~n", [Reason]),
	Reason.

stop() ->
	io:format("test_child: stop~n"),
	stop(normal).

stop(Reason) ->
	io:format("test_child: stop ~p~n", [Reason]),
	?MODULE ! Reason,
	ok.



