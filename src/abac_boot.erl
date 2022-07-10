-module(abac_boot).
-compile(export_all).
-include("abac.hrl").
-include("request.hrl").
-include("objects.hrl").
-include("subjects.hrl").
-include_lib("kvs/include/kvs.hrl").
-include_lib("bpe/include/bpe.hrl").

policy(Default) -> [
  #policy{
    api_endpoint = sign,
    combining    = all,
    object       = #object_process{ module = 'Elixir.Output.Proc',
                                    stage = #sequenceFlow { source = "Created",
                                                            target = "Development"}},
    rules        = [
      #rule{
        api_endpoint = sign,
        subject      = #subject_employee { roles = [register, executor],
                                           routing = [executor],
                                           org = Default},
        type         = permit,
        condition    = employee_check,
        object       = #object_process { module = 'Elixir.Output.Proc',
                                         stage = #sequenceFlow{source = "Created",
                                         target = "Development"}}
      }
    ]
  }
].

boot() ->
  lists:foreach(fun (#policy{rules = R} = P) ->
    NewR =
      lists:map(fun (#rule{object = O} = X) ->
        I = kvs:seq([], []),
        kvs:put(X#rule{id = I}, #kvs{mod = kvs_mnesia}),
        #rule_ref{id = I, resource_type = element(1, O)}
      end, R),
    kvs:put(P#policy{id = kvs:seq([], []), rules = NewR}, #kvs{mod = kvs_mnesia})
  end, policy(application:get_env(crm, active_org, "MIA:TEST"))).

