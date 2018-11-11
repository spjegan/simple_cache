%%%-------------------------------------------------------------------
%%% @author jegan
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. Oct 2018 7:49 PM
%%%-------------------------------------------------------------------

-module('simple_cache_sup').

-behaviour(supervisor).

%% API
-export([start_link/0, start_child/2]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%====================================================================
%% API functions
%%====================================================================

start_link() ->
  supervisor:start_link({local, ?SERVER}, ?MODULE, []).

start_child(Value, LeaseTime) ->
  supervisor:start_child(?SERVER, [Value, LeaseTime]).

%%====================================================================
%% Supervisor callbacks
%%====================================================================

%% Child :: {Id,StartFunc,Restart,Shutdown,Type,Modules}
init([]) ->
  Element = {simple_cache_element, {simple_cache_element, start_link, []}, temporary, brutal_kill, worker, [simple_cache_element]},
  Children = [Element],
  RestartStrategy = {simple_one_for_one, 0, 1},
  {ok, {RestartStrategy, Children}}.

%%====================================================================
%% Internal functions
%%====================================================================
