
-module(webchess_sup).
-vsn(1).
-behaviour(supervisor).
-export([start_link/0, init/1]).


start_link() ->
	io:format("webchess_sup: start~n"),
	supervisor:start_link(?MODULE, []).

init(_Args) ->
	io:format("webchess_sup: init~n"),
	SupFlags = #{
		strategy => one_for_one,
%		auto_shutdown => never,
		intensity => 4,
		period => 3600
	},
	ChildSpecs = [
	%	#{id := httpd_sup,
		#{id => test_sup,
			start => {test_sup, start_link, []},
			restart => temporary,
%			significant => false,
			shutdown => infinity,
			type => supervisor,
			modules => [test_sup]
		}
	],
	{ok, {SupFlags, ChildSpecs}}.

