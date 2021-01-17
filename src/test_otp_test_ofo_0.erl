%%%-------------------------------------------------------------------
%%% @doc
%%% test_otp_test_ofo_0
%%% @end
%%%-------------------------------------------------------------------
-module(test_otp_test_ofo_0).
-behaviour(gen_server).

-record(state, {
    args
}).

-export([
    start_link/1,
    set_args/1,
    test_error/1
]).

-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

%%%===================================================================
%%% API
%%%===================================================================
start_link(Args) ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [Args], []).

set_args(Args) ->
    gen_server:cast(?MODULE, {set_args, Args}).

test_error(N) ->
    gen_server:cast(?MODULE, {test_error, N}).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================
init([Args]) ->
    io:format("test_otp_test_ofo_0 worker is starting...args:~p~n", [Args]),
    process_flag(trap_exit, true),
    {ok, #state{args = Args}}.

handle_call(Msg, _From, State) ->
    io:format("unknown call msg:~p~n", [Msg]),
    {reply, ok, State}.

handle_cast({set_args, Args}, State) ->
    {noreply, State#state{args = Args}};
handle_cast({test_error, N}, State) ->
    Val = 0 + N,
    {noreply, State#state{args = Val}};
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
