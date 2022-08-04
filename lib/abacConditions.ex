defmodule ABAC.Condition do
  require ABAC

  def employee_check(
    ABAC.request(subject: ABAC.subject_employee(roles: roles, org: o, routing: r, status: s1, substitute_type: st1)),
    ABAC.rule(subject: ABAC.subject_employee(id: [], org: o, routing: r2, roles: roles2, branch: [], status: s2, substitute_type: st2))
  ), do: (:lists.any(&:lists.member(&1, s1), s2) or s1 == s2) and :lists.any(&:lists.member(&1, roles2), roles) and (st2 in [:any, st1] or st1 in st2) and (:lists.any(&:lists.member(&1, r2), r) or r2 == [])
  def employee_check(
    ABAC.request(subject: ABAC.subject_employee(roles: roles, branch: b, org: o, routing: r, status: s1, substitute_type: st1)),
    ABAC.rule(subject: ABAC.subject_employee(id: [], org: o, roles: roles2, routing: r2, branch: b, status: s2, substitute_type: st2))
  ), do: (:lists.any(&:lists.member(&1, s1), s2) or s1 == s2) and :lists.any(&:lists.member(&1, roles2), roles) and (st2 in [:any, st1] or st1 in st2) and (:lists.any(&:lists.member(&1, r2), r) or r2 == [])
  def employee_check(
    ABAC.request(subject: ABAC.subject_employee(id: i, roles: roles, branch: b, org: o, routing: r, status: s1, substitute_type: st1)),
    ABAC.rule(subject: ABAC.subject_employee(id: i, org: o, routing: r2, roles: roles2, branch: b, status: s2, substitute_type: st2))
  ), do: (:lists.any(&:lists.member(&1, s1), s2) or s1 == s2) and :lists.any(&:lists.member(&1, roles2), roles) and (st2 in [:any, st1] or st1 in st2) and (:lists.any(&:lists.member(&1, r2), r) or r2 == [])
  def employee_check(_, _), do: false

  def form_check(ABAC.object_form(id: i), ABAC.rule(object: ABAC.object_form(id: i))), do: true
  def form_check(_, _), do: false

  def file_check(ABAC.object_file(type: t, sign: s, convert: c, needCert: nc, certificate: cert), ABAC.rule(object: ABAC.object_file(type: t2, sign: s2, convert: c2, needCert: nc2, certificate: cert2))), do:
    (t2 in [t, :any] and s2 in [s, :any] and c2 in [c, :any] and nc2 in [nc, :any] and cert2 in [cert, :any])
  def file_check(_, _), do: false

  def sched_check(ABAC.object_process(module: m, stage: s), ABAC.rule(object: ABAC.object_process(module: m, stage: s))), do: true
  def sched_check(_, _), do: false

  def executor_check(ABAC.object_executor(type: t, status: s1, routing: r, roles: roles), ABAC.rule(object: ABAC.object_executor(type: t, status: s2, routing: r2, roles: roles2))), do:
    ((:lists.any(&:lists.member(&1, s1), s2) or s1 == s2)and (:lists.any(&:lists.member(&1, r2), r) or r2 == []) and (:lists.any(&:lists.member(&1, roles2), roles) or roles2 == []))
  def executor_check(_, _), do: false
end
