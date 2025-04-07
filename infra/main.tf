locals {
    # Fetch Configurations defined in the YAML file for the environment
    configurations = yamldecode(file("./${var.environment}/${var.environment}.yml"))
    # Group the configurations by resource type for easier access
    configurations_by_resource = {
        for obj in local.configurations : obj.resource => obj...
    }

    /* A map of secrets that are injected via ci / cd */
    secrets_map = {
        "BACKEND_API_URL" : var.BACKEND_API_URL
        "FILE_CONVERTER_API_SECRET" : var.FILE_CONVERTER_API_SECRET
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


    secrets_map = local.secrets_map

    providers = {
        render = render
    }



}