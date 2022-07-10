defmodule ABAC.PDP do
  require ABAC
  require BPE
  require KVS
  require Record

  def policy(request, ABAC.policy(rules: r, combining: :all)), do: :lists.all(&rule(request, &1), r)
  def policy(request, ABAC.policy(rules: r, combining: :any)), do: :lists.any(&rule(request, &1), r)
  def policy(request, ABAC.policy(rules: r, combining: c)) do
    fold = fn ABAC.rule_ref(id: i) -> rule(request, :erlang.element(2, :kvs.get(:rule, i, KVS.kvs(mod: :kvs_mnesia)))) end
    :erlang.apply(:lists, c, [fold, r])
  end
  def policy(_, _), do: false

  def rule(
    ABAC.request(endpoint: e, resources: resources) = request,
    ABAC.rule(api_endpoint: e, type: :permit, object: o, condition: c, resource_match: rm) = rule)
    do
    x = :lists.filter(fn ^o -> true; _ -> false end, resources)
    fold = fn _ -> :erlang.apply(:"Elixir.ABAC.Condition", c, [request, rule]) end
    x != [] and :erlang.apply(:lists, rm, [fold, x])
  end

  def rule(_, _), do: false

  def match(x, acc) do
      case :kvs.index_match(x, :object, KVS.kvs(mod: :kvs_mnesia)) do
        [ABAC.policy() | _ ] = p -> p ++ acc
        _ -> acc
      end
  end

  # PDP
  def decision(request) do
    {new_request, policy} = ABAC.Attributes.request(request)
    x = :lists.foldl(fn x, acc -> match(x, acc) end, [], policy)
    x != [] and :lists.all(&policy(new_request, &1), x)
  end

end
