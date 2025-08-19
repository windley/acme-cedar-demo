permit(
  principal is ACME::Customer,
  action == ACME::Action::"doc:view",
  resource is ACME::Document
)
when {
  principal in resource.customer_readers_team
};