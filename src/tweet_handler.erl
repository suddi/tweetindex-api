-module(tweet_handler).
-author("Sudharshan Ravindran <suddir@gmail.com>").

-export([init/3, content_types_provided/2, tweet_to_json/2]).

init(_Transport, _Req, Opts) ->
    {upgrade, protocol, cowboy_rest}.

content_types_provided(Req, State) ->
    headers:content_types_provided(tweet_to_json, Req, State).

tweet_to_json(Req, State) ->
    {jiffy:encode(status:get_ok()), Req, State}.
