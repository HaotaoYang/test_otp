%%%-------------------------------------------------------------------
%%% @doc
%%% test_otp_test_simple_ofo supervisor
%%% @end
%%%-------------------------------------------------------------------
-module(test_otp_test_simple_ofo_sup).
-behaviour(supervisor).

-export([init/1]).

-export([
    start_link/0,
    start_child/1,
    children/0
]).

%%%===================================================================
%%% API functions
%%%===================================================================
start_link() ->
    case random:uniform(2) of
        1 -> supervisor:start_link({local, ?MODULE}, ?MODULE, [test_otp_test_simple_ofo_1]);
        _ -> supervisor:start_link({local, ?MODULE}, ?MODULE, [test_otp_test_simple_ofo_2])
    end.

start_child(Args) ->
    supervisor:start_child(?MODULE, [Args]).

children() ->
    supervisor:which_children(?MODULE).

%%%===================================================================
%%% Supervisor callbacks
%%%===================================================================

init([Module]) ->
    SupFlags = #{strategy => simple_one_for_one, intensity => 5, period => 1},
    Children = #{
        id => Module,
        start => {Module, start_link, []},
        restart => permanent,
        shutdown => 5000,
        type => worker,
        modules => [Module]
    },
    {ok, {SupFlags, [Children]}}.

%%%===================================================================
%%% Internal functions
%%%===================================================================
