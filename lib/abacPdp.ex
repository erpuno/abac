defmodule ABAC.PDP do
  require ABAC
  require BPE
  require KVS
  require Record

  # PDP
  def decision(request) do
    {new_request, policy} = ABAC.Attributes.request(request)
    x = :lists.foldl(fn x, acc ->
      case :kvs.index_match(x, :object, KVS.kvs(mod: :kvs_mnesia)) do
        [ABAC.policy() | _ ] = p -> p ++ acc
        _ -> acc
      end
    end, [], policy)
    x != [] and :lists.all(&policy(new_request, &1), x)
  end

  def policy(ABAC.request(endpoint: e, resources: resources) = request, ABAC.policy(rules: r, combining: :all)) do
    :lists.all(fn ABAC.rule_ref(id: i, resource_type: t) ->
      case :lists.keyfind(t, 1, resources) do
        false -> false
        object ->
          case :kvs.index_match(ABAC.rule(id: i,
                                          subject: :_,
                                          api_endpoint: e,
                                          description: :_,
                                          type: :permit,
                                          condition: :_,
                                          object: object), :object, KVS.kvs(mod: :kvs_mnesia)) do
            [ABAC.rule(condition: c) = rule] -> :erlang.apply(:"Elixir.ABAC.Condition", c, [request, rule])
            _ -> false
          end
      end
    end, r)
  end
  def policy(_, _), do: false

end
