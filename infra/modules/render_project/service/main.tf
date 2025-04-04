resource "render_private_service" "service" {
    for_each = {for s in var.services : s.name => s}
    region   = each.value.region
    name     = each.value.name
    plan     = each.value.plan
    runtime_source = each.value.runtime_source
    environment_id = var.environment_id
}