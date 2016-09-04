-module(routes).
-author("Sudharshan Ravindran <suddir@gmail.com>").

-export([get_routes/0]).
-export([validate_stockcode/1]).

-define(ANY_HOST, '_').
-define(NO_OPTIONS, []).

get_routes() ->
    [{?ANY_HOST, get_pathlist()}].

get_pathlist() ->
    [
        {"/", whoami_handler, ?NO_OPTIONS},
        {"/v1/tweet/:stock_code", get_constraints(), tweet_handler, {constraints_met, true}}
    ].

get_constraints() ->
    [
        {stock_code, function, fun validate_stockcode/1}
    ].

validate_stockcode(StockCode) ->
    NumChars = byte_size(StockCode),
    if NumChars > 0, NumChars =< 4 -> true;
       NumChars =<0, NumChars > 4 -> false
    end.
