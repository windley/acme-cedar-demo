permit(
  principal is ACME::Employee,
  action == ACME::Action::"doc:view",
  resource is ACME::Document
)
when {
  principal in resource.employee_readers_team
  || resource.owner.manager == principal
};