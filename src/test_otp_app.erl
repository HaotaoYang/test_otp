%%%-------------------------------------------------------------------
%% @doc test_otp public API
%% @end
%%%-------------------------------------------------------------------

-module(test_otp_app).

-behaviour(application).

-export([
    start/2,
    prep_stop/1,
    stop/1
]).

%%%===================================================================
%%% Application callbacks
%%%===================================================================
start(_StartType, _StartArgs) ->
    ok = prep_start(),
    case test_otp_sup:start_link() of
        {ok, Pid} ->
            post_start(),
            {ok, Pid};
        Error ->
            Error
    end.

prep_stop(_State) ->
    io:format("============> test_app prep stop... ~n"),
    ok.

stop(_State) ->
    io:format("============> test_app stop... ~n"),
    ok.

%%%===================================================================
%%% Internal functions
%%%===================================================================

-spec prep_start() -> ok.
prep_start() ->
    io:format("============> test_app prep start... ~n"),
    ok.

-spec post_start() -> ok.
post_start() ->
    io:format("============> test_app post start... ~n"),
    ok.
