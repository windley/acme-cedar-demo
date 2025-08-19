// Owner can do all defined document actions
permit(
  principal is ACME::Employee,
  action in [ ACME::Action::"doc:view",
              ACME::Action::"doc:edit",
              ACME::Action::"doc:share" ],
  resource is ACME::Document
)
when { resource.owner == principal };