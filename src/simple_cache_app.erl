%%%-------------------------------------------------------------------
%%% @author jegan
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. Oct 2018 7:49 PM
%%%-------------------------------------------------------------------

-module('simple_cache_app').

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
  simple_cache_store:init(),
  case simple_cache_sup:start_link() of
  	{ok, Pid} -> {ok, Pid};
  	Other -> {error, Other}
  end.	
	

%%--------------------------------------------------------------------
stop(_State) ->
  ok.
