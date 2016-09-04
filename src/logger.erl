-module(logger).

-export([set/1]).

set(Input) ->
    io:format("~p~n", Input).
