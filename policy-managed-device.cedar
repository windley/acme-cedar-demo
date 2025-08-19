// Global guardrail: employees on unmanaged devices are forbidden for any document action
forbid(
  principal is ACME::Employee,
  action,
  resource is ACME::Document
)
when { context.device.managed == false };