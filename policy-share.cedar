// Non-owner delegates: employees on the employee_readers_team may share if the doc is delegatable
permit(
  principal is ACME::Employee,
  action == ACME::Action::"doc:share",
  resource is ACME::Document
)
when {
  resource.delegatable == true
  && principal in resource.employee_readers_team
};