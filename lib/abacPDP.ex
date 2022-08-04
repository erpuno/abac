defmodule ABAC.PDP do
  require ABAC
  require KVS

  # PDP
  def decision(req0) do
    {req, policy} = ABAC.PIP.request(req0)
    :lists.any(&policy(req, &1), :lists.flatten(:lists.map(&:kvs.index_match(&1, :object, KVS.kvs(mod: :kvs_mnesia)), policy)))
  end

  def deny(req0) do
    {req, policy} = ABAC.PIP.request(req0)
    :lists.any(&!policy(req, &1), :lists.flatten(:lists.map(&:kvs.index_match(&1, :object, KVS.kvs(mod: :kvs_mnesia)), policy)))
  end

  def get(req0) do
    {ABAC.request() = req, policy} = ABAC.PIP.request(req0)
    :lists.flatten(:lists.map(fn x ->
      :lists.filtermap(fn ABAC.rule(values: []) -> false; ABAC.rule(values: v, object: o) -> {true, :kvs.field(o, v)} end, policy(req, x))
    end, :lists.flatten(:lists.map(&:kvs.index_match(&1, :object, KVS.kvs(mod: :kvs_mnesia)), policy))))
  end

  def parse(r), do: ABAC.PIP.parse(r)

  def policy(ABAC.request(type: t) = req, ABAC.policy(rules: r, combining: c)) when t in [:decision, :deny], do:
    :erlang.apply(:lists, c, [&rule(req, :erlang.element(2, :kvs.get(:rule, ABAC.rule_ref(&1, :id), KVS.kvs(mod: :kvs_mnesia)))), r])
  def policy(ABAC.request(type: :get) = req, ABAC.policy(rules: r, combining: :all)), do:
    :erlang.element(2, :lists.foldr(fn _, {false, _} = x -> x
                                       ABAC.rule_ref(id: i), {true, acc} ->
      rule = :erlang.element(2, :kvs.get(:rule, i, KVS.kvs(mod: :kvs_mnesia)))
      if rule(req, rule), do: {true, [rule | acc]}, else: {false, []}
    end, {true, []}, r))
  def policy(ABAC.request(type: :get) = req, ABAC.policy(rules: r)), do:
    :lists.foldr(fn ABAC.rule_ref(id: i), acc ->
      x = :erlang.element(2, :kvs.get(:rule, i, KVS.kvs(mod: :kvs_mnesia)))
      case rule(req, x) do true -> [x | acc]; _ -> acc end
    end, [], r)
  def policy(ABAC.request(type: :decision), _), do: false
  def policy(ABAC.request(type: :deny), _), do: true
  def policy(ABAC.request(type: :get), _), do: []

  def rule(
    ABAC.request(endpoint: e, resources: resources) = req,
    ABAC.rule(api_endpoint: e, type: t, object_condition: [], object: o, subject_condition: c, resource_match: rm) = r
  ), do:
    (x = :lists.filter(fn ^o -> true; _ -> false end, resources);
     result(t, x != [] and :erlang.apply(:lists, rm, [fn _ -> :erlang.apply(:"Elixir.ABAC.Condition", c, [req, r]) end, x])))
  def rule(
    ABAC.request(endpoint: e, resources: resources) = req,
    ABAC.rule(api_endpoint: e, type: t, object_condition: oc, object: o, subject_condition: c, resource_match: rm) = r
  ), do:
    (x = :lists.filter(&(:erlang.is_record(&1, :erlang.element(1, o))), resources);
     result(t, x != [] and :erlang.apply(:lists, rm, [fn x -> :erlang.apply(:"Elixir.ABAC.Condition", c, [req, r]) and :erlang.apply(:"Elixir.ABAC.Condition", oc, [x, r]) end, x])))
  def rule(_, _), do: false

  defp result(:permit, x), do: x
  defp result(:deny, x), do: !x

end
