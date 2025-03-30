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

    providers = {
        aws.east = aws.east
    }


    for_each = {for cluster in local.configurations_by_resource["ecs"] : 
        cluster.name => cluster
    }

    # Pass the clusters and environment configurations to the ECS module
    ecs_config = each.value
    environment = var.environment
}