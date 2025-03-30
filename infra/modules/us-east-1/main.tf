locals {
    # Fetch Configurations defined in the YAML file for the environment
    configurations = yamldecode(file("${path.module}/../../prod/prod.yml"))

    # Group the configurations by resource type for easier access
    configurations_by_resource = {
        for obj in local.configurations : obj.resource => obj...
    }
}

/* Creation of ecs clusters, tasks, etc */
module "ecs" {
    source = "../ecs"
    clusters = try(local.configurations_by_resource["ecs_cluster"], [])
    providers = {
        aws = aws.east
    }
}
