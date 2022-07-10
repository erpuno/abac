defmodule ABAC.Condition do
  require ABAC

  def employee_check(
    ABAC.request(subject: ABAC.subject_employee(roles: roles, org: o, routing: r)),
    ABAC.rule(type: :permit, subject: ABAC.subject_employee(id: [], org: o, routing: r2, roles: roles2, branch: []))
  ), do: :lists.any(&:lists.member(&1, roles2), roles) and :lists.any(&:lists.member(&1, r2), r)

  def employee_check(
    ABAC.request(subject: ABAC.subject_employee(roles: roles, branch: b, org: o, routing: r)),
    ABAC.rule(type: :permit, subject: ABAC.subject_employee(id: [], org: o, roles: roles2, routing: r2, branch: b))
  ), do: :lists.any(&:lists.member(&1, roles2), roles) and :lists.any(&:lists.member(&1, r2), r)

  def employee_check(
    ABAC.request(subject: ABAC.subject_employee(id: i, roles: roles, branch: b, org: o, routing: r)),
    ABAC.rule(type: :permit, subject: ABAC.subject_employee(id: i, org: o, routing: r2, roles: roles2, branch: b))
  ), do: :lists.any(&:lists.member(&1, roles2), roles) and :lists.any(&:lists.member(&1, r2), r)

  def employee_check(_, _), do: false

  def approvers_check(_, _), do: false

end