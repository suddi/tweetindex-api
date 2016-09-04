-module(whoami_handler).
-author("Sudharshan Ravindran <suddir@gmail.com>").

-export([init/3, content_types_provided/2, whoami_to_json/2]).

init(_Type, _, []) ->
    {upgrade, protocol, cowboy_rest}.

content_types_provided(Req, State) ->
    headers:content_types_provided(whoami_to_json, Req, State).

whoami_to_json(Req, State) ->
    {jiffy:encode(status:get_ok()), Req, State}.
