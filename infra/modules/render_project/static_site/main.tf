resource "render_static_site" "static_site" {
    for_each = {for static_site in var.static_sites : static_site.name => static_site}

    name = each.value.name
    repo_url = each.value.repo_url
    build_command = each.value.build_command
    publish_path = each.value.publish_path
    branch = each.value.branch
    root_directory = each.value.root_directory
}