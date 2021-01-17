%%%-------------------------------------------------------------------
%%% @doc
%%% test_otp_test_ofo supervisor
%%% @end
%%%-------------------------------------------------------------------
-module(test_otp_test_ofo_sup).
-behaviour(supervisor).

-export([init/1]).

-export([
    start_link/0,
    start_child/2,
    children/0
]).

%%%===================================================================
%%% API functions
%%%===================================================================
start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

start_child(Module, Args) ->
    Child = #{
        id => Module,
        start => {Module, start_link, [Args]},
        restart => permanent,
        shutdown => 5000,
        type => worker,
        modules => [Module]
    },
    supervisor:start_child(?MODULE, Child).

children() ->
    supervisor:which_children(?MODULE).

%%%===================================================================
%%% Supervisor callbacks
%%%===================================================================

init([]) ->
    SupFlags = #{strategy => one_for_one, intensity => 5, period => 1},
    Children = [
        #{
            id => test_otp_test_ofo_0,
            start => {test_otp_test_ofo_0, start_link, [test_0]},
            restart => permanent,
            shutdown => 5000,
            type => worker,
            modules => [test_otp_test_ofo_0]
         },
        #{
            id => test_otp_test_ofo_n,
            start => {test_otp_test_ofo_n, start_link, [test_n]},
            restart => permanent,
            shutdown => 5000,
            type => worker,
            modules => [test_otp_test_ofo_n]
         }
    ],
    {ok, {SupFlags, Children}}.

%%%===================================================================
%%% Internal functions
%%%===================================================================
