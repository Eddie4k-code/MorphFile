
locals {
    envs_mapped = {
        for env in var.render_project.environments :
        env.name => env
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


module "static_sites" {
   for_each = local.envs_mapped

    source = "./static_site"

    static_sites = each.value.static_sites

    depends_on = [
        render_project.project
    ]
}