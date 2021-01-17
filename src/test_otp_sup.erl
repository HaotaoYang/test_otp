%%%-------------------------------------------------------------------
%% @doc test_otp top level supervisor.
%% @end
%%%-------------------------------------------------------------------
-module(test_otp_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

%%====================================================================
%% API functions
%%====================================================================

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%%====================================================================
%% Supervisor callbacks
%%====================================================================

init([]) ->
    SupFlags = #{strategy => one_for_one, intensity => 5, period => 10},
    Children = [
        %% test simple_one_for_one sup
        #{id => test_otp_test_simple_ofo_sup, start => {test_otp_test_simple_ofo_sup, start_link, []}, modules => [test_otp_test_simple_ofo_sup],
            restart => permanent, shutdown => infinity, type => supervisor},
        %% test one_for_one sup
        #{id => test_otp_test_ofo_sup, start => {test_otp_test_ofo_sup, start_link, []}, modules => [test_otp_test_ofo_sup],
            restart => permanent, shutdown => infinity, type => supervisor}
    ],
    {ok, {SupFlags, Children}}.

%%====================================================================
%% Internal functions
%%====================================================================
