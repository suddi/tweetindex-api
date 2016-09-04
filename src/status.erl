-module(status).
-author("Sudharshan Ravindran <suddir@gmail.com>").

-export([get_ok/0]).

get_ok() ->
    {[
        {
            <<"status">>, {[
                {<<"code">>, 200},
                {<<"message">>, <<"OK">>},
                {<<"details">>, []},
                {<<"retryable">>, true}
            ]}
        },
        {
            <<"data">>, {[]}
        }
    ]}.
