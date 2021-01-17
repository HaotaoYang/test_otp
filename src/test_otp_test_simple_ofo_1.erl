%%%-------------------------------------------------------------------
%%% @doc
%%% test_otp_test_simple_ofo_1
%%% @end
%%%-------------------------------------------------------------------
-module(test_otp_test_simple_ofo_1).
-behaviour(gen_server).

-record(state, {
    args
}).

-export([
    start_link/1
]).

-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

%%%===================================================================
%%% API
%%%===================================================================
start_link(Args) ->
    gen_server:start_link(?MODULE, [Args], []).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================
init([Args]) ->
    io:format("test_otp_test_simple_ofo_1 worker is starting...args:~p~n", [Args]),
    process_flag(trap_exit, true),
    {ok, #state{args = Args}}.

handle_call(Msg, _From, State) ->
    io:format("unknown call msg:~p~n", [Msg]),
    {reply, ok, State}.

handle_cast(Msg, State) ->
    io:format("unknown cast msg:~p~n", [Msg]),
    {noreply, State}.

handle_info(Info, State) ->
    io:format("unknown info msg:~p~n", [Info]),
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%%===================================================================
%%% Internal functions
%%%===================================================================
