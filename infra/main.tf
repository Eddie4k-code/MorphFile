locals {
    # Fetch Configurations defined in the YAML file for the environment
    configurations = yamldecode(file("./${var.environment}/${var.environment}.yml"))
    # Group the configurations by resource type for easier access
    configurations_by_resource = {
        for obj in local.configurations : obj.resource => obj...
    }
}

/* Creation of ecs clusters, tasks, etc */
module "render_project" {
    source = "./modules/render_project"

    for_each = {

        for project in local.configurations_by_resource["render_project"]:
            project.name => project
        }

    render_project = each.value

    providers = {
        render = render
    }



}