
locals {
    envs_mapped = {
        for env in var.render_project.environments :
        env.name => {
            name = env.name
            protected_status = env.protected_status
        }
    }
}

resource "render_project" "project" {

    name = var.render_project.name

    environments = local.envs_mapped
    
}

module "private_services" {
    source = "./service" 
    for_each = local.envs_mapped

    project_name = render_project.project.name

    services = each.value.services

    depends_on = [ 
        render_project.project
    ]
}