defmodule ABAC.Condition do
  require ABAC

  def employee_check(
    ABAC.request(subject: ABAC.subject_employee(roles: roles)),
    ABAC.rule(type: :permit, subject: ABAC.subject_employee(id: [], roles: roles2, branch: []))
  ), do: :lists.any(&:lists.member(&1, roles2), roles)
  def employee_check(
    ABAC.request(subject: ABAC.subject_employee(roles: roles, branch: b)),
    ABAC.rule(type: :permit, subject: ABAC.subject_employee(id: [], roles: roles2, branch: b2))
  ) when b == b2, do: :lists.any(&:lists.member(&1, roles2), roles)
  def employee_check(
    ABAC.request(subject: ABAC.subject_employee(id: i, roles: roles, branch: b)),
    ABAC.rule(type: :permit, subject: ABAC.subject_employee(id: i2, roles: roles2, branch: b2))
  ) when i == i2 and b == b2, do: :lists.any(&:lists.member(&1, roles2), roles)
  def employee_check(_, _), do: false

  def approvers_check(_, _), do: false

end