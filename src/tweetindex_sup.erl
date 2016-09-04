%%%-------------------------------------------------------------------
%% @doc tweetindex top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(tweetindex_sup).
-author("Sudharshan Ravindran <suddir@gmail.com>").
-behaviour(supervisor).


%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

%%====================================================================
%% API functions
%%====================================================================
-spec start_link() -> {ok, pid()}.
start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%%====================================================================
%% Supervisor callbacks
%%====================================================================

%% Child :: {Id,StartFunc,Restart,Shutdown,Type,Modules}
init([]) ->
    {ok, {{one_for_one, 10, 10}, []}}.

%%====================================================================
%% Internal functions
%%====================================================================
