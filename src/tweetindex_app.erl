%%%-------------------------------------------------------------------
%% @doc tweetindex public API
%% @end
%%%-------------------------------------------------------------------

-module(tweetindex_app).
-author("Sudharshan Ravindran <suddir@gmail.com>").
-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_Type, _Args) ->
    Dispatch = cowboy_router:compile(routes:get_routes()),
    {ok, _} = cowboy:start_http(http, 100, [{port, 8000}], [
        {env, [{dispatch, Dispatch}]}
    ]),
    tweetindex_sup:start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================
