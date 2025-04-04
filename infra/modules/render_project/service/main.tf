resource "render_private_Service" "service" {
    name = var.name
    plan = var.plan
    region = var.region
}