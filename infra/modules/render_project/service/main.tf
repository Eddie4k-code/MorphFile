resource "render_web_service" "service" {
    for_each = {for s in var.services : s.name => s}
    region   = each.value.region
    name     = each.value.name
    plan     = each.value.plan
    runtime_source = each.value.runtime_source
    env_vars = {
        for secret in each.value.secrets :
        secret.name => {
            value = var.secrets_map[secret.name]
        }
}

}