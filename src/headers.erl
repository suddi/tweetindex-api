-module(headers).
-author("Sudharshan Ravindran <suddir@gmail.com>").

-export([content_types_provided/3]).

content_types_provided(Func, Req, State) ->
    {[
        {<<"application/json">>, Func}
    ], Req, State}.
