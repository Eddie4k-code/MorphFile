
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