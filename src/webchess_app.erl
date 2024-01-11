
-module(webchess_app).
-behaviour(application).

-export([start/2, stop/1]).

start(_Type, _Args) ->
	io:format("webchess_app: start~n"),
	Httpd_conf = [
		{port, 3333},
		{server_name,"webchess"},
		{server_root,"../httpd"},
		{document_root,"../httpd/htdocs"},
		{bind_address,  "localhost"}
	],
	inets:start(permanent),
	{ok, Httpd} = inets:start(httpd, Httpd_conf),
    {ok, Webchess} = webchess_sup:start_link(),
	{ok, Webchess, #{httpd => Httpd}}.

stop(#{httpd := Httpd}) ->
	io:format("webchess_app: stop~n"),
	inets:stop(httpd, Httpd).


