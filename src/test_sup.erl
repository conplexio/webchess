
-module(test_sup).
-vsn(1).
-behaviour(supervisor).
-export([start_link/0, init/1]).


start_link() ->
	io:format("test_sup: start~n"),
	supervisor:start_link(?MODULE, []).


init(_Args) ->
	io:format("test_sup: init~n"),
	SupFlags = #{
		strategy => one_for_one,
%		auto_shutdown => any_significant
		intensity => 4,
		period => 3600
	},
	ChildSpecs = [
		#{id => test_child,
			start => {test_child, start_link, []},
			restart => transient,
%			significant => true,
			shutdown => brutal_kill,
			type => worker,
			modules => [test_child]
		}
	],
	{ok, {SupFlags, ChildSpecs}}.


