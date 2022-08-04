defmodule ABAC.PIP do
  require ABAC
  require ERP
  require BPE
  require FORM

  # PIP
  def request(ABAC.request(endpoint: e, subject: s, context: ABAC.context() = c) = r) do
    {resources, policy} = :lists.foldl(fn {name, _}, {r, acc} ->
      case object(name, c) do
        [] -> {r, acc}
        x when is_list(x) ->
          {x ++ r, :lists.map(&ABAC.policy(id: :_, creator: :_, api_endpoint: e, description: :_, combining: :_, object: &1, rules: :_), x) ++ acc}
        x -> {[x | r], [ABAC.policy(id: :_, creator: :_, api_endpoint: e, description: :_, combining: :_, object: x, rules: :_) | acc]}
      end
    end, {[], []}, :lists.zip(:kvs.fields(:context), tl(:erlang.tuple_to_list(c))))
    {ABAC.request(r, subject: subject(s, c), resources: resources), policy}
  end
  def request(_), do: {[], []}

  def parse(ABAC.request(subject: s, context: ABAC.context() = c) = r), do:
    (x = [:context | :lists.map(fn {name, _} -> object(name, c) end, :lists.zip(:kvs.fields(:context), tl(:erlang.tuple_to_list(c))))]
     |> :erlang.list_to_tuple()
     ABAC.request(r, subject: subject(s, c), context: x))
  def parse(x), do: x

  defp subject(ERP."Employee"(substitute: ERP.assistant(head: ERP."Employee"(id: i, role: r, org: o, branch: b)))), do:
    ABAC.subject_employee(id: i, roles: :lists.map(fn ERP.crmRole(id: x) -> x ; x -> x end, r), org: o, branch: b, substitute_type: :assistant)
  defp subject(ERP."Employee"(rightsDelegation: ERP.rightsDelegation(tempDutiesPerform: true, user: ERP."Employee"(id: i, role: r, org: o, branch: b)))), do:
    ABAC.subject_employee(id: i, roles: :lists.map(fn ERP.crmRole(id: x) -> x ; x -> x end, r), org: o, branch: b, substitute_type: :tempDutiesPerform)
  defp subject(ERP."Employee"(rightsDelegation: ERP.rightsDelegation(user: ERP."Employee"(id: i, role: r, org: o, branch: b)))), do:
    ABAC.subject_employee(id: i, roles: :lists.map(fn ERP.crmRole(id: x) -> x ; x -> x end, r), org: o, branch: b, substitute_type: :delegat)
  defp subject(ERP."Employee"(id: i, role: r, org: o, branch: b)), do:
    ABAC.subject_employee(id: i, roles: :lists.map(fn ERP.crmRole(id: x) -> x ; x -> x end, r), org: o, branch: b, substitute_type: [])

  defp subject(ABAC.subject_employee() = e, _), do: e
  defp subject(ERP."Employee"() = e, ABAC.context(pid: [])), do: subject(e)
  defp subject(ERP."Employee"() = e, ABAC.context(pid: pid)) do
    BPE.process(executors: execs, docs: [doc | _]) = :bpe.load(pid)
    ABAC.subject_employee(id: i) = subj = subject(e)
    status = case :lists.keyfind(i, 2, execs) do BPE.executor(status: s) -> :lists.map(&BPE.status(&1, :id), s); _ -> [] end
    routing =
      :lists.foldl(fn {name, ERP."Employee"(id: x)}, acc when x == i -> [name | acc]
                      {name, [_ | _] = x}, acc -> case :lists.keyfind(i, 2, :lists.flatten(x)) do false -> acc; _ -> [name | acc] end
                      _, acc -> acc
      end, [], :lists.zip(:kvs.fields(:erlang.element(1, doc)), tl(:erlang.tuple_to_list(doc))))
    ABAC.subject_employee(subj, status: status, routing: routing)
  end
  defp subject(_, _), do: []

  defp object(:form, ABAC.context(form: ABAC.object_form() = f)), do: f
  defp object(:form, ABAC.context(form: FORM.document(id: i))), do:
    ABAC.object_form(id: i)
  defp object(:form, ABAC.context(form: FORM.formReg(id: i))), do:
    ABAC.object_form(id: i)
  defp object(:pid, ABAC.context(pid: ABAC.object_process() = p)), do: p
  defp object(:pid, ABAC.context(pid: [ABAC.object_process() | _] = p)), do: p
  defp object(:pid, ABAC.context(pid: [])), do: []
  defp object(:pid, ABAC.context(pid: pid)) do
    BPE.process(module: m) = proc = :bpe.load(pid)
    BPE.hist(task: BPE.sequenceFlow(source: s, target: t)) = :bpe.head(pid)
    status = m.status({:request, s, t}, proc)
    [ABAC.object_process(module: m, status: status, stage: BPE.sequenceFlow(source: s, target: t), status: sS), ABAC.object_process(module: m, stage: t, status: status)]
  end
  defp object(:files, ABAC.context(files: ABAC.object_file() = f)), do: f
  defp object(:files, ABAC.context(files: ERP.fileDesc(type: t, needSign: s, hash: c, needCertification: nc, certificate: cert))), do:
    ABAC.object_file(type: t, sign: s, convert: c, needCert: nc, certificate: cert != [])
  defp object(:files, ABAC.context(files: [ABAC.object_file() | _] = f)), do: f
  defp object(:files, ABAC.context(files: [ERP.fileDesc() | _] = x)), do:
    :lists.map(fn ERP.fileDesc(type: t, needSign: s, hash: c, needCertification: nc, certificate: cert) ->
      ABAC.object_file(type: t, sign: s, convert: c, needCert: nc, certificate: cert != []) end, x)
  defp object(:corr, ABAC.context(corr: ABAC.object_corr() = c)), do: c
  defp object(:corr, ABAC.context(corr: ERP."Organization"(id: i))), do:
    ABAC.object_corr(id: i)
  defp object(:corr, ABAC.context(corr: ABAC.object_email() = e)), do: e
  defp object(:corr, ABAC.context(corr: ERP.orgEmail(email: e))), do:
    ABAC.object_email(id: e)
  defp object(:employee, ABAC.context(employee: ABAC.object_employee() = e)) ,do: e
  defp object(:employee, ABAC.context(employee: ERP."Employee"(id: i))), do:
    ABAC.object_employee(id: i)
  defp object(:executors, ABAC.context(executors: [ABAC.object_executor() | _] = e)), do: e
  defp object(:executors, ABAC.context(pid: pid, executors: [BPE.executor() | _] = execs)), do:
    (case :bpe.load(pid) do BPE.process(docs: [doc | _]) -> :lists.flatten(:lists.map(&executor(&1, doc), execs)) ; _ -> [] end)
  defp object(:executors, ABAC.context(pid: pid)) when is_binary(pid), do:
    (case :bpe.load(pid) do BPE.process(executors: execs, docs: [doc | _]) -> :lists.flatten(:lists.map(&executor(&1, doc), execs)) ; _ -> [] end)
  defp object(:notification, ABAC.context(notification: ABAC.object_notification() = n)), do: n
  defp object(:notification, ABAC.context(notification: ERP.dict(id: i))), do:
    ABAC.object_notification(id: i)
  defp object(:notification, ABAC.context(notification: ERP.userNotification(type: t))), do:
   ABAC.object_notification(id: t)
  defp object(_, _), do: []

  defp executor(BPE.executor(id: r, object: ERP.crmRole()), _), do:
    ABAC.object_executor(roles: [r])
  defp executor(BPE.executor(id: i, status: s, object: ERP."Employee"(type: t, role: r)), doc) do
    status = :lists.map(&BPE.status(&1, :id), s)
    routing =
      :lists.foldl(fn {name, ERP."Employee"(id: x)}, acc when x == i -> [name | acc]
                      {name, [_ | _] = x}, acc -> case :lists.keyfind(i, 2, :lists.flatten(x)) do false -> acc; _ -> [name | acc] end
                      _, acc -> acc
      end, [], :lists.zip(:kvs.fields(:erlang.element(1, doc)), tl(:erlang.tuple_to_list(doc))))
    type = case t do "output" -> t ; _ -> [] end
    ABAC.object_executor(type: type, status: status, routing: routing, roles: :lists.map(fn ERP.crmRole(id: x) -> x ; x -> x end, r))
  end
  defp executor(_, _), do: []

end
