defmodule ABAC.Attributes do
  require ABAC
  require ERP
  require BPE
  require FORM

  # PIP

  def request(ABAC.request(endpoint: e, subject: s, context: ABAC.context() = c) = r) do
    {resources, policy} =
      :lists.foldl(
        fn {name, _}, {r, acc} ->
          case object(name, c) do
            [] ->
              {r, acc}

            x when is_list(x) ->
              {x ++ r, :lists.map(&ABAC.policy(id: :_, api_endpoint: e, description: :_, combining: :_, object: &1, rules: :_), x) ++ acc}

            x ->
              {[x | r], [ABAC.policy(id: :_, api_endpoint: e, description: :_, combining: :_, object: x, rules: :_) | acc]}
          end
        end,
        {[], []},
        :lists.zip(:kvs.fields(:context), tl(:erlang.tuple_to_list(c)))
      )

    {ABAC.request(r, subject: subject(s, c), resources: resources), policy}
  end

  def request(_), do: {[], []}

  defp subject(ERP."Employee"(substitute: ERP.assistant(head: ERP."Employee"(id: i, role: r, org: o, branch: b)))),
    do: ABAC.subject_employee(id: i, roles: r, org: o, branch: b, substitute_type: :assistant)

  defp subject(ERP."Employee"(rightsDelegation: ERP.rightsDelegation(user: ERP."Employee"(id: i, role: r, org: o, branch: b)))),
    do: ABAC.subject_employee(id: i, roles: r, org: o, branch: b, substitute_type: :delegat)

  defp subject(ERP."Employee"(id: i, role: r, org: o, branch: b)),
    do: ABAC.subject_employee(id: i, roles: r, org: o, branch: b, substitute_type: :assistant)

  defp subject(ERP."Employee"(id: i) = e, ABAC.context(pid: pid)) do
    BPE.process(executors: execs, docs: [doc | _]) = :bpe.load(pid)

    status =
      case :lists.keyfind(i, 2, execs) do
        BPE.executor(status: :complete = s) -> s
        _ -> []
      end

    routing =
      :lists.foldl(
        fn
          {name, ERP."Employee"(id: x)}, acc when x == i ->
            [name | acc]

          {name, [ERP."Employee"() | _] = x}, acc ->
            case :lists.keyfind(i, 2, x) do
              false -> acc
              _ -> [name | acc]
            end

          _, acc ->
            acc
        end,
        [],
        :lists.zip(:kvs.fields(:erlang.element(1, doc)), tl(:erlang.tuple_to_list(doc)))
      )

    ABAC.subject_employee(subject(e), status: status, routing: routing)
  end

  defp subject(_, _), do: []

  defp object(:form, ABAC.context(form: FORM.document(id: i, fields: f))), do: ABAC.object_form(id: i, fields: f)
  defp object(:form, ABAC.context(form: FORM.formReg(id: i))), do: ABAC.object_form(id: i)

  defp object(:pid, ABAC.context(pid: pid, stage_status: sS)) do
    BPE.process(module: m) = :bpe.load(pid)
    BPE.hist(task: BPE.sequenceFlow(source: source, target: target)) = :bpe.head(pid)
    ABAC.object_process(module: m, stage: BPE.sequenceFlow(source: source, target: target), status: sS)
  end

  defp object(:files, ABAC.context(files: [ERP.fileDesc() | _] = x)),
    # TODO: file type
    do: :lists.map(fn ERP.fileDesc(needSign: s, hash: c) -> ABAC.object_file(sign: s, convert: c) end, x)

  defp object(:corr, ABAC.context(corr: ERP."Organization"(id: i))), do: ABAC.object_corr(id: i)
  defp object(:corr, ABAC.context(corr: ERP.orgEmail(email: e))), do: ABAC.object_email(id: e)
  defp object(:employee, ABAC.context(employee: ERP."Employee"(id: i))), do: ABAC.object_employee(id: i)
  defp object(_, _), do: []
end
